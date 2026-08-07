.class public Ll/e1i;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e1i$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/e1i$b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/content/Context;

.field public c:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Ll/uzh;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ll/uzh;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e1i$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/e1i$a;-><init>(Ll/e1i;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/e1i;->c:Ll/h80;

    .line 10
    .line 11
    iput-object p1, p0, Ll/e1i;->a:Ljava/util/List;

    .line 12
    .line 13
    iput-object p2, p0, Ll/e1i;->b:Landroid/content/Context;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic y(Ll/e1i;ILl/uzh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e1i;->A(ILl/uzh;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(ILl/uzh;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1i;->d:Ll/z20;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C(Ll/e1i$b;I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/e1i;->z()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    rem-int v0, p2, v0

    .line 6
    .line 7
    iget-object v1, p0, Ll/e1i;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/uzh;

    .line 14
    .line 15
    invoke-static {}, Ll/cmg;->A()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    const/high16 v2, 0x42c80000    # 100.0f

    .line 23
    .line 24
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    iget-object v5, p1, Ll/e1i$b;->b:Lv/AutoVDraweeView;

    .line 29
    .line 30
    new-array v6, v3, [Landroid/view/View;

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    aput-object v5, v6, v7

    .line 34
    .line 35
    invoke-static {v4, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object v4, p1, Ll/e1i$b;->b:Lv/AutoVDraweeView;

    .line 39
    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {v4, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v2, p1, Ll/e1i$b;->b:Lv/AutoVDraweeView;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/uzh;->c()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v2, v4, v3}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/e1i;->c:Ll/h80;

    .line 57
    .line 58
    iget-object v3, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v2, v3, v1, v0}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 64
    .line 65
    new-instance v0, Ll/d1i;

    .line 66
    .line 67
    invoke-direct {v0, p0, p2, v1}, Ll/d1i;-><init>(Ll/e1i;ILl/uzh;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public D(Landroid/view/ViewGroup;I)Ll/e1i$b;
    .locals 3

    .line 1
    new-instance p2, Ll/e1i$b;

    .line 2
    .line 3
    iget-object v0, p0, Ll/e1i;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/tec0;->k3:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p2, p0, p1}, Ll/e1i$b;-><init>(Ll/e1i;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-object p2
.end method

.method public E(Ll/e1i$b;)V
    .locals 0
    .param p1    # Ll/e1i$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/e1i;->c:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public F(Ll/e1i$b;)V
    .locals 0
    .param p1    # Ll/e1i$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/e1i;->c:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public G(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ll/uzh;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/e1i;->d:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const p0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/e1i$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/e1i;->C(Ll/e1i$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e1i;->D(Landroid/view/ViewGroup;I)Ll/e1i$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/e1i$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e1i;->E(Ll/e1i$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/e1i$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e1i;->F(Ll/e1i$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1i;->a:Ljava/util/List;

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
