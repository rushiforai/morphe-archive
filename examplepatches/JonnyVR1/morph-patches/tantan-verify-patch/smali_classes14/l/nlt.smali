.class public Ll/nlt;
.super Ll/mic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mic0<",
        "Ll/olt;",
        ">;"
    }
.end annotation


# instance fields
.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/olt;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/olt;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/y20;Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olt;",
            ">;",
            "Ll/y20<",
            "Ll/olt;",
            ">;",
            "Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/mic0;-><init>(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/nlt;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    iput-object p3, p0, Ll/nlt;->f:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic G(Ll/nlt;Ll/olt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nlt;->J(Ll/olt;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/olt;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/nlt;->H(Landroid/view/View;Ll/olt;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nlt;->d:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/xec0;->o0:I

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p0, p1, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public H(Landroid/view/View;Ll/olt;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/mic0;->A(Landroid/view/View;Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;

    .line 5
    .line 6
    iget-object p3, p0, Ll/nlt;->f:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 7
    .line 8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    iget-object p3, p0, Ll/nlt;->f:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 15
    .line 16
    iget-object p3, p3, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p3, ""

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;->e(Ll/olt;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p3, p0, Ll/nlt;->e:Ll/y20;

    .line 25
    .line 26
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;->c:Lv/VImage;

    .line 33
    .line 34
    new-instance p3, Ll/mlt;

    .line 35
    .line 36
    invoke-direct {p3, p0, p2}, Ll/mlt;-><init>(Ll/nlt;Ll/olt;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public I(I)Ll/olt;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nlt;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/olt;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic J(Ll/olt;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nlt;->e:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/olt;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nlt;->e:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public L(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olt;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nlt;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nlt;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nlt;->I(I)Ll/olt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
