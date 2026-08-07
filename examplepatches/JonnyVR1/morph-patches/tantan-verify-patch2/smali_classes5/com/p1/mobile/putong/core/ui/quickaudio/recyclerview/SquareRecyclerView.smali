.class public Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;
.super Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView<",
        "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
        "Ll/f0g0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->e:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->e:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->e:Ljava/util/HashSet;

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->V(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic K()Ll/tr2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->U()Ll/f0g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public U()Ll/f0g0;
    .locals 2

    .line 1
    new-instance v0, Ll/f0g0;

    .line 2
    .line 3
    new-instance v1, Ll/h0g0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h0g0;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/f0g0;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->d:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public X(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public setClickListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;->d:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
