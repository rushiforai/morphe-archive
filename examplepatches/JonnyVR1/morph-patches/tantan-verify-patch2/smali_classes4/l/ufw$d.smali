.class public Ll/ufw$d;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ufw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/ufw$e;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ufw$d;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ufw$d;->c:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public A(Ll/ufw$e;I)V
    .locals 4
    .param p1    # Ll/ufw$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Ll/ufw$e;->a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    sget-object v1, Ll/ufw;->l:[Ljava/lang/String;

    .line 4
    .line 5
    aget-object v1, v1, p2

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/ufw$b;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ll/ufw$d;->z(I)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Ll/ufw$b;-><init>(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Ll/ufw$e;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 22
    .line 23
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p1, Ll/ufw$e;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/ufw$d$a;

    .line 41
    .line 42
    invoke-direct {p1, p0, v0, p2}, Ll/ufw$d$a;-><init>(Ll/ufw$d;Ll/ufw$b;I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ll/ufw$b;->C(Ll/x20;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public C(Landroid/view/ViewGroup;I)Ll/ufw$e;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance p0, Ll/ufw$e;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget v0, Ll/kec0;->J6:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {p0, p1}, Ll/ufw$e;-><init>(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public D(ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->status:Ljava/util/List;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->feature:Ljava/util/List;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const/4 v0, 0x2

    .line 17
    if-ne p1, v0, :cond_4

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :cond_2
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

    .line 39
    .line 40
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->selected:Z

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    iget v0, v0, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->id:I

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object p0, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->selectedInterest:Ljava/util/List;

    .line 57
    .line 58
    :cond_4
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    sget-object p0, Ll/ufw;->l:[Ljava/lang/String;

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/ufw$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ufw$d;->A(Ll/ufw$e;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ufw$d;->C(Landroid/view/ViewGroup;I)Ll/ufw$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y()Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->status:Ljava/util/List;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 v1, 0x1

    .line 14
    if-ne p1, v1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->feature:Ljava/util/List;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const/4 v1, 0x2

    .line 22
    if-ne p1, v1, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Ll/ufw$d;->c:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->new_()Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    iput v3, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->id:I

    .line 57
    .line 58
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->value:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v3, p0, Ll/ufw$d;->b:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->selectedInterest:Ljava/util/List;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {v3, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iput-boolean v1, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->selected:Z

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    return-object v0
.end method
