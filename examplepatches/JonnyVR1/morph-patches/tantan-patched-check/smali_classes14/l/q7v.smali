.class public Ll/q7v;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public j:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

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
    iput-object v0, p0, Ll/q7v;->k:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/q7v;Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/q7v;->g0(Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;ILandroid/view/View;)V

    return-void
.end method

.method private f0()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/q7v;->k:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Ll/q7v;->k:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;

    .line 22
    .line 23
    new-instance v3, Ll/s7v;

    .line 24
    .line 25
    invoke-direct {v3, v2}, Ll/s7v;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;)V

    .line 26
    .line 27
    .line 28
    new-instance v4, Ll/p7v;

    .line 29
    .line 30
    invoke-direct {v4, p0, v2, v1}, Ll/p7v;-><init>(Ll/q7v;Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0
.end method


# virtual methods
.method public L(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/xec0;->Z1:I

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
    return-object p0
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7v;->j:Ll/z20;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q7v;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/q7v;->f0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i0(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q7v;->j:Ll/z20;

    .line 2
    .line 3
    return-void
.end method
