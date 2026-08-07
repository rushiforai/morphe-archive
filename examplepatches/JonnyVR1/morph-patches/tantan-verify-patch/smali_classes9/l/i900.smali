.class public Ll/i900;
.super Ll/m900;
.source "SourceFile"

# interfaces
.implements Ll/p4m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i900$b;,
        Ll/i900$a;
    }
.end annotation


# instance fields
.field public k:Ll/l900;

.field public l:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/i900$b;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/i900$b;",
            ">;"
        }
    .end annotation
.end field

.field public o:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/i900$b;",
            ">;"
        }
    .end annotation
.end field

.field public p:I

.field public q:Z

.field public r:I

.field public s:Ll/i900$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;Ll/l900;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/m900;-><init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/i900;->m:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/i900;->n:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Ll/i900;->p:I

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/i900;->q:Z

    .line 29
    .line 30
    iput v0, p0, Ll/i900;->r:I

    .line 31
    .line 32
    iput-object p2, p0, Ll/i900;->k:Ll/l900;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 39
    .line 40
    iput-object p1, p0, Ll/i900;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 41
    .line 42
    return-void
.end method

.method private h0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i900;->k:Ll/l900;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/i900;->k:Ll/l900;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/lzl;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private i0(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/i900$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    :cond_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/i900$b;

    .line 25
    .line 26
    iget-object v0, v0, Ll/i900$b;->b:Landroid/view/View;

    .line 27
    .line 28
    if-ne v0, p1, :cond_1

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p2, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-ge v0, p2, :cond_4

    .line 41
    .line 42
    iget-object v1, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ll/i900$b;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    iget-object v1, v1, Ll/i900$b;->b:Landroid/view/View;

    .line 53
    .line 54
    if-ne v1, p1, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->removeAt(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/i900;->Y(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/i900;->c0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    add-int/2addr v0, p0

    .line 15
    return v0
.end method

.method public bridge synthetic D(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i900;->e0(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final E(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const v0, 0xc350

    .line 2
    .line 3
    .line 4
    if-lt p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/i900$b;

    .line 13
    .line 14
    iget-object p0, p0, Ll/i900$b;->b:Landroid/view/View;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/i900;->k:Ll/l900;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Ll/l900;->w(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public F(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/i900;->k:Ll/l900;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sub-int/2addr p1, p0

    .line 26
    invoke-interface {v0, p1}, Ll/lzl;->e(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public final V(I)Lcom/p1/mobile/putong/core/data/Message;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ll/i3z;->getItemCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lt p1, v1, :cond_1

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_1
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ge p1, v0, :cond_2

    .line 17
    .line 18
    iget-object p0, p0, Ll/i900;->m:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/i900$b;

    .line 25
    .line 26
    iget-object p0, p0, Ll/i900$b;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    if-lt p1, v0, :cond_3

    .line 39
    .line 40
    iget-object v0, p0, Ll/i900;->n:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sub-int/2addr p1, v1

    .line 47
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    sub-int/2addr p1, p0

    .line 52
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ll/i900$b;

    .line 57
    .line 58
    iget-object p0, p0, Ll/i900$b;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_3
    invoke-virtual {p0, p1}, Ll/i900;->e0(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public final Y(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V
    .locals 1

    .line 1
    const v0, 0xc738

    .line 2
    .line 3
    .line 4
    if-ge p3, v0, :cond_1

    .line 5
    .line 6
    const v0, 0xc350

    .line 7
    .line 8
    .line 9
    if-lt p3, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/i900;->k:Ll/l900;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    sub-int/2addr p4, p0

    .line 19
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/l900;->a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Message;II)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public final Z()Ll/i900$a;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/i900;->s:Ll/i900$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/i900$a;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Ll/i900$a;-><init>(Ll/i900;Ll/j900;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/i900;->s:Ll/i900$a;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0}, Ll/i900$a;->a()V

    .line 15
    .line 16
    .line 17
    :goto_0
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz v0, :cond_6

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-ne v0, v2, :cond_1

    .line 31
    .line 32
    goto/16 :goto_2

    .line 33
    .line 34
    :cond_1
    iget-object v2, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->getLastVisiblePosition()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iget-object v3, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->getFirstVisiblePosition()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget-object v4, p0, Ll/i900;->s:Ll/i900$a;

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    iput-boolean v5, v4, Ll/i900$a;->d:Z

    .line 50
    .line 51
    if-nez v3, :cond_2

    .line 52
    .line 53
    if-lez v2, :cond_2

    .line 54
    .line 55
    iget v4, p0, Ll/i900;->r:I

    .line 56
    .line 57
    sub-int/2addr v4, v1

    .line 58
    if-ne v2, v4, :cond_2

    .line 59
    .line 60
    iget-object v2, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 61
    .line 62
    sub-int/2addr v0, v1

    .line 63
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v2, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    iget-object v3, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 80
    .line 81
    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    sub-int/2addr v2, v3

    .line 86
    if-ne v0, v2, :cond_5

    .line 87
    .line 88
    iget-object v0, p0, Ll/i900;->s:Ll/i900$a;

    .line 89
    .line 90
    iput-boolean v1, v0, Ll/i900$a;->d:Z

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    if-lez v2, :cond_4

    .line 94
    .line 95
    iget v4, p0, Ll/i900;->r:I

    .line 96
    .line 97
    sub-int/2addr v4, v1

    .line 98
    if-ne v2, v4, :cond_4

    .line 99
    .line 100
    iget-object v4, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 101
    .line 102
    add-int/lit8 v5, v0, -0x1

    .line 103
    .line 104
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    iget-object v5, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 113
    .line 114
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    sub-int/2addr v4, v5

    .line 119
    iget-object v5, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 120
    .line 121
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-virtual {p0}, Ll/i900;->g0()I

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    sub-int/2addr v5, v6

    .line 130
    if-ne v5, v4, :cond_3

    .line 131
    .line 132
    iget-object v0, p0, Ll/i900;->s:Ll/i900$a;

    .line 133
    .line 134
    iput-boolean v1, v0, Ll/i900$a;->d:Z

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    invoke-virtual {p0, v0, v3, v2}, Ll/i900;->b0(III)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    invoke-virtual {p0, v0, v3, v2}, Ll/i900;->b0(III)V

    .line 142
    .line 143
    .line 144
    :cond_5
    :goto_1
    iget-object p0, p0, Ll/i900;->s:Ll/i900$a;

    .line 145
    .line 146
    return-object p0

    .line 147
    :cond_6
    :goto_2
    iget-object p0, p0, Ll/i900;->s:Ll/i900$a;

    .line 148
    .line 149
    iput-boolean v1, p0, Ll/i900$a;->d:Z

    .line 150
    .line 151
    return-object p0
.end method

.method public final a0(IILl/i900$a;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p1, p3, Ll/i900$a;->c:I

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-ne p2, p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/i900$a;->a()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    iput-boolean p0, p3, Ll/i900$a;->d:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final b0(III)V
    .locals 3

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    :goto_0
    if-ltz p1, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-lt v1, p2, :cond_1

    .line 18
    .line 19
    if-le v1, p3, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    instance-of v1, v0, Ll/x6q;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    move-object v1, v0

    .line 27
    check-cast v1, Ll/x6q;

    .line 28
    .line 29
    invoke-interface {v1}, Ll/x6q;->message()Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object p2, p0, Ll/i900;->s:Ll/i900$a;

    .line 40
    .line 41
    iget-wide v1, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 42
    .line 43
    iput-wide v1, p2, Ll/i900$a;->a:J

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    sub-int/2addr p3, v0

    .line 56
    iput p3, p2, Ll/i900$a;->c:I

    .line 57
    .line 58
    iget p2, p0, Ll/i900;->r:I

    .line 59
    .line 60
    iget-object p3, p0, Ll/i900;->s:Ll/i900$a;

    .line 61
    .line 62
    invoke-virtual {p0, p1, p2, p3}, Ll/i900;->a0(IILl/i900$a;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    :goto_1
    add-int/lit8 p1, p1, -0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method

.method public final c0()I
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/i900;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/i900;->q:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/i900;->n:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final d0()I
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/i900;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/i900;->q:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/i900;->m:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final e0(I)Lcom/p1/mobile/putong/core/data/Message;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/i900;->k:Ll/l900;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sub-int/2addr p1, p0

    .line 26
    invoke-virtual {v0, p1}, Ll/l900;->m(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public f0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i900;->k:Ll/l900;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l900;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g0()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/2addr v0, p0

    .line 14
    return v0
.end method

.method public getItemId(I)J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i900;->k:Ll/l900;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/i900;->m:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/i900$b;

    .line 22
    .line 23
    iget-object p0, p0, Ll/i900$b;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    iget-wide p0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 26
    .line 27
    return-wide p0

    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/2addr v0, v1

    .line 37
    if-lt p1, v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/i900;->n:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    sub-int/2addr p1, v1

    .line 46
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    sub-int/2addr p1, p0

    .line 51
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ll/i900$b;

    .line 56
    .line 57
    iget-object p0, p0, Ll/i900$b;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 58
    .line 59
    iget-wide p0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 60
    .line 61
    return-wide p0

    .line 62
    :cond_1
    invoke-virtual {p0, p1}, Ll/i900;->e0(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-wide p0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 67
    .line 68
    return-wide p0

    .line 69
    :cond_2
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemId(I)J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    return-wide p0
.end method

.method public final getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/i900;->m:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/i900$b;

    .line 14
    .line 15
    iget p0, p0, Ll/i900$b;->a:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr v0, v1

    .line 27
    if-lt p1, v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/i900;->n:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sub-int/2addr p1, v1

    .line 36
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sub-int/2addr p1, p0

    .line 41
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/i900$b;

    .line 46
    .line 47
    iget p0, p0, Ll/i900$b;->a:I

    .line 48
    .line 49
    return p0

    .line 50
    :cond_1
    iget-object v0, p0, Ll/i900;->k:Ll/l900;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    sub-int/2addr p1, p0

    .line 57
    invoke-virtual {v0, p1}, Ll/l900;->p(I)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public i(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/i900$b;

    .line 24
    .line 25
    iget v2, p0, Ll/i900;->p:I

    .line 26
    .line 27
    const v3, 0xc738

    .line 28
    .line 29
    .line 30
    add-int/2addr v2, v3

    .line 31
    invoke-direct {v1, p0, v2, v0}, Ll/i900$b;-><init>(Ll/i900;ILandroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/i900;->n:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 40
    .line 41
    iget v2, v1, Ll/i900$b;->a:I

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/i900;->p:I

    .line 47
    .line 48
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    iput v0, p0, Ll/i900;->p:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i900;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/i900;->i0(Landroid/view/View;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final j0(Ll/i900$a;)V
    .locals 6

    .line 1
    iget-boolean v0, p1, Ll/i900$a;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/i900;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/i3z;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/lit8 p0, p0, -0x1

    .line 12
    .line 13
    const/16 v0, -0x2710

    .line 14
    .line 15
    invoke-virtual {p1, p0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-wide v0, p1, Ll/i900$a;->a:J

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    if-lez v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    :goto_0
    if-ltz v0, :cond_6

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/i900;->e0(I)Lcom/p1/mobile/putong/core/data/Message;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    iget-wide v2, v2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 47
    .line 48
    iget-wide v4, p1, Ll/i900$a;->a:J

    .line 49
    .line 50
    cmp-long v2, v2, v4

    .line 51
    .line 52
    if-nez v2, :cond_1

    .line 53
    .line 54
    move v1, v0

    .line 55
    goto :goto_3

    .line 56
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget v0, p1, Ll/i900$a;->b:I

    .line 60
    .line 61
    if-lez v0, :cond_6

    .line 62
    .line 63
    const v2, 0xc738

    .line 64
    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    if-le v0, v2, :cond_4

    .line 68
    .line 69
    :goto_1
    invoke-virtual {p0}, Ll/i900;->c0()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-ge v3, v0, :cond_6

    .line 74
    .line 75
    iget-object v0, p0, Ll/i900;->n:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/i900$b;

    .line 82
    .line 83
    iget v0, v0, Ll/i900$b;->a:I

    .line 84
    .line 85
    iget v2, p1, Ll/i900$a;->b:I

    .line 86
    .line 87
    if-ne v0, v2, :cond_3

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr v3, v0

    .line 94
    invoke-virtual {p0}, Ll/i900;->f0()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int v1, v3, v0

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    :goto_2
    invoke-virtual {p0}, Ll/i900;->d0()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-ge v3, v0, :cond_6

    .line 109
    .line 110
    iget-object v0, p0, Ll/i900;->m:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ll/i900$b;

    .line 117
    .line 118
    iget v0, v0, Ll/i900$b;->a:I

    .line 119
    .line 120
    iget v2, p1, Ll/i900$a;->b:I

    .line 121
    .line 122
    if-ne v0, v2, :cond_5

    .line 123
    .line 124
    move v1, v3

    .line 125
    goto :goto_3

    .line 126
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_6
    :goto_3
    if-ltz v1, :cond_7

    .line 130
    .line 131
    iget-object p0, p0, Ll/i900;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 132
    .line 133
    iget p1, p1, Ll/i900$a;->c:I

    .line 134
    .line 135
    invoke-virtual {p0, v1, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 136
    .line 137
    .line 138
    :cond_7
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/i900;->Z()Ll/i900$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i900;->j0(Ll/i900$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/i3z;->getItemCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/i900;->r:I

    .line 16
    .line 17
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/i900;->q:Z

    .line 3
    .line 4
    return-void
.end method

.method public final t(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Ll/i900$b;

    .line 2
    .line 3
    iget v1, p0, Ll/i900;->p:I

    .line 4
    .line 5
    const v2, 0xc350

    .line 6
    .line 7
    .line 8
    add-int/2addr v1, v2

    .line 9
    invoke-direct {v0, p0, v1, p1}, Ll/i900$b;-><init>(Ll/i900;ILandroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/i900;->m:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 18
    .line 19
    iget v1, v0, Ll/i900$b;->a:I

    .line 20
    .line 21
    invoke-virtual {p1, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, Ll/i900;->p:I

    .line 25
    .line 26
    add-int/lit8 p1, p1, 0x1

    .line 27
    .line 28
    iput p1, p0, Ll/i900;->p:I

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i3z;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;->setSelection(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/i900;->n()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public x(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/i900$b;

    .line 24
    .line 25
    iget v2, p0, Ll/i900;->p:I

    .line 26
    .line 27
    const v3, 0xc350

    .line 28
    .line 29
    .line 30
    add-int/2addr v2, v3

    .line 31
    invoke-direct {v1, p0, v2, v0}, Ll/i900$b;-><init>(Ll/i900;ILandroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/i900;->m:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/i900;->o:Landroid/util/SparseArray;

    .line 40
    .line 41
    iget v2, v1, Ll/i900$b;->a:I

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/i900;->p:I

    .line 47
    .line 48
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    iput v0, p0, Ll/i900;->p:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method
