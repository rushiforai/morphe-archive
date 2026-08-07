.class public Ll/ja80;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public final j:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "*>;"
        }
    .end annotation
.end field

.field public final k:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/data/Pagination;

.field public m:Ljava/lang/String;

.field public final n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;Ll/z20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;)V"
        }
    .end annotation

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
    iput-object v0, p0, Ll/ja80;->n:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ja80;->j:Ll/dum;

    .line 12
    .line 13
    iput-object p3, p0, Ll/ja80;->k:Ll/z20;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/ja80;->l0(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/ja80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)Ll/ka80;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ja80;->k0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)Ll/ka80;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public f0(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iput-object v0, p0, Ll/ja80;->l:Lcom/p1/mobile/putong/data/Pagination;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ja80;->n:Ljava/util/List;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->anchors:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Ll/ja80;->n:Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Ll/ja80;->h0(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/d3q;

    .line 3
    .line 4
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final h0(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            ">;)",
            "Ljava/util/List<",
            "Ll/ka80;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ia80;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ia80;-><init>(Ll/ja80;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public i0()Lcom/p1/mobile/putong/data/Pagination;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja80;->l:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    return-object p0
.end method

.method public j0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja80;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic k0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)Ll/ka80;
    .locals 2

    .line 1
    new-instance v0, Ll/ka80;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ja80;->j:Ll/dum;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ja80;->k:Ll/z20;

    .line 6
    .line 7
    invoke-direct {v0, v1, p1, p2, p0}, Ll/ka80;-><init>(Ll/dum;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Ll/z20;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ja80;->n:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ja80;->n:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->anchors:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 14
    .line 15
    iput-object v0, p0, Ll/ja80;->l:Lcom/p1/mobile/putong/data/Pagination;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->type:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, p0, Ll/ja80;->m:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p0, Ll/ja80;->n:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/ja80;->h0(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
