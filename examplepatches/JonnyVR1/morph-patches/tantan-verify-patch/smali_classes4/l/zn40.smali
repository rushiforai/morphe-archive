.class public Ll/zn40;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zn40$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/zn40$a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserCheckWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

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
    iput-object v0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method private synthetic D(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zn40;->A(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Ll/zn40;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zn40;->E(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/zn40;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/zn40;->D(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 8
    .line 9
    iget-object v1, p0, Ll/zn40;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 16
    .line 17
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->checked:Z

    .line 18
    .line 19
    xor-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->checked:Z

    .line 22
    .line 23
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public C()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    iget-object p0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 23
    .line 24
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->checked:Z

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->user:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-object v0
.end method

.method public final synthetic E(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zn40;->A(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F(Ll/zn40$a;I)V
    .locals 3
    .param p1    # Ll/zn40$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/zn40$a;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Ll/zn40;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->user:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 37
    .line 38
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->checked:Z

    .line 39
    .line 40
    iget-object v1, p1, Ll/zn40$a;->c:Landroid/widget/ImageView;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    sget v0, Ll/ibc0;->O3:I

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget v0, Ll/ibc0;->P3:I

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object v0, p1, Ll/zn40$a;->b:Lv/VText;

    .line 56
    .line 57
    iget-object v1, p0, Ll/zn40;->a:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->user:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    iget-object v0, p1, Ll/zn40$a;->a:Lv/VDraweeView;

    .line 73
    .line 74
    new-instance v1, Ll/xn40;

    .line 75
    .line 76
    invoke-direct {v1, p0, p2}, Ll/xn40;-><init>(Ll/zn40;I)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p1, Ll/zn40$a;->c:Landroid/widget/ImageView;

    .line 83
    .line 84
    new-instance v0, Ll/yn40;

    .line 85
    .line 86
    invoke-direct {v0, p0, p2}, Ll/yn40;-><init>(Ll/zn40;I)V

    .line 87
    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public G(Ll/zn40$a;ILjava/util/List;)V
    .locals 0
    .param p1    # Ll/zn40$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zn40$a;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/zn40;->F(Ll/zn40$a;I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->checked:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p1, Ll/zn40$a;->c:Landroid/widget/ImageView;

    .line 24
    .line 25
    sget p1, Ll/ibc0;->O3:I

    .line 26
    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p0, p1, Ll/zn40$a;->c:Landroid/widget/ImageView;

    .line 32
    .line 33
    sget p1, Ll/ibc0;->P3:I

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public H(Landroid/view/ViewGroup;I)Ll/zn40$a;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/qec0;->c4:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/zn40$a;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/zn40$a;-><init>(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public I(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->new_()Lcom/p1/mobile/putong/core/data/UserCheckWrapper;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x1

    .line 27
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->checked:Z

    .line 28
    .line 29
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/UserCheckWrapper;->user:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zn40;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/zn40$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zn40;->F(Ll/zn40$a;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;ILjava/util/List;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 7
    check-cast p1, Ll/zn40$a;

    invoke-virtual {p0, p1, p2, p3}, Ll/zn40;->G(Ll/zn40$a;ILjava/util/List;)V

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
    invoke-virtual {p0, p1, p2}, Ll/zn40;->H(Landroid/view/ViewGroup;I)Ll/zn40$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
