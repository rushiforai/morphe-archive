.class public Ll/qjo$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qjo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qjo$a$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/TribeSubset;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Landroidx/recyclerview/widget/RecyclerView$n;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Ll/qjo;


# direct methods
.method public constructor <init>(Ll/qjo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qjo$a;->e:Ll/qjo;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/qjo$a$a;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/qjo$a$a;-><init>(Ll/qjo$a;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/qjo$a;->c:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/qjo;Ll/sjo;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/qjo$a;-><init>(Ll/qjo;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/TribeSubset;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qjo$a;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/TribeSubset;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjo$a;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qjo$a;->e:Ll/qjo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qjo;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/pec0;->V:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/TribeSubset;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;

    .line 2
    .line 3
    iget-object p3, p0, Ll/qjo$a;->e:Ll/qjo;

    .line 4
    .line 5
    invoke-static {p3}, Ll/qjo;->b(Ll/qjo;)Ll/ojo;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;->Q(Lcom/p1/mobile/putong/core/data/TribeSubset;Ll/ojo;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeItemView;->e:Lv/VRecyclerView;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    check-cast p3, Ll/qjo$b;

    .line 19
    .line 20
    if-nez p3, :cond_0

    .line 21
    .line 22
    new-instance p3, Ll/qjo$b;

    .line 23
    .line 24
    iget-object p4, p0, Ll/qjo$a;->e:Ll/qjo;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-direct {p3, p4, v0}, Ll/qjo$b;-><init>(Ll/qjo;Ll/sjo;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/qjo$a;->c:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/TribeSubset;->subsetContent:Ljava/util/List;

    .line 43
    .line 44
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/TribeSubset;->groupCategory:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p3, p0, p1}, Ll/qjo$b;->I(Ljava/util/List;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/core/data/TribeSubset;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjo$a;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/data/TribeSubset;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qjo$a;->d:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/qjo$a;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v1, Ll/qjo$a$b;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0, p1}, Ll/qjo$a$b;-><init>(Ll/qjo$a;Ljava/util/List;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Landroidx/recyclerview/widget/g;->b(Landroidx/recyclerview/widget/g$b;)Landroidx/recyclerview/widget/g$e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object p1, p0, Ll/qjo$a;->d:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/g$e;->b(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qjo$a;->F(I)Lcom/p1/mobile/putong/core/data/TribeSubset;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
