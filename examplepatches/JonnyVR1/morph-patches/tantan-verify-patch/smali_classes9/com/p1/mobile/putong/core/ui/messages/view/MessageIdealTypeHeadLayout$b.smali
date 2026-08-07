.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->a:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;Ll/aez;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->z(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;I)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->a(Lcom/p1/mobile/putong/data/Media;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;
    .locals 2
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
    move-result-object p2

    .line 5
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Ll/qec0;->G1:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/zdz;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/zdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 27
    .line 28
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-object p2
.end method

.method public D(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->a:Ljava/util/List;

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

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->a:Ljava/util/List;

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
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->A(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;I)V

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->C(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
