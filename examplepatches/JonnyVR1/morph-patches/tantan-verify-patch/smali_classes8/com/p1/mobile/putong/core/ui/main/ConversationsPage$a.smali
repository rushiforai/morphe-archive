.class public Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;"
    }
.end annotation


# instance fields
.field public c:I

.field public d:Z

.field public e:Z

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/lrc0;

.field public final synthetic h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->c:I

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->d:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->e:Z

    .line 12
    .line 13
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->f:Ljava/util/List;

    .line 16
    .line 17
    new-instance v0, Ll/lrc0;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->K(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->T:Lv/VRecyclerView;

    .line 24
    .line 25
    new-instance v2, Ll/cs6;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/cs6;-><init>(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;)V

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x4

    .line 31
    invoke-direct {v0, v1, p1, v2, v3}, Ll/lrc0;-><init>(Ll/ner;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->g:Ll/lrc0;

    .line 35
    .line 36
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;Ll/ds6;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;-><init>(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->I(Ljava/lang/Integer;)V

    return-void
.end method

.method private synthetic I(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->H(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->k(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->U:Z

    .line 4
    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->J(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->d:Z

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->c:I

    .line 17
    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v1, 0x1

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->f:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    add-int/2addr v0, p0

    .line 31
    return v0

    .line 32
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->f:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->K(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/qec0;->I4:I

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

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 7

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Lcom/p1/mobile/putong/core/ui/main/ConversationView;

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    .line 7
    .line 8
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->U:Z

    .line 9
    .line 10
    iget-object v4, p1, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->V:Ll/y20;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->J(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    move-object v1, p0

    .line 17
    move-object v2, p2

    .line 18
    move v6, p4

    .line 19
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/main/ConversationView;->j(Ll/jic0;Lcom/p1/mobile/putong/core/data/Conversation;ZLl/y20;II)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final G(I)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->f:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    return-object p0
.end method

.method public H(I)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->U:Z

    .line 4
    .line 5
    if-eqz v1, :cond_3

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->J(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->d:Z

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->c:I

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    :cond_1
    if-ge p1, v0, :cond_2

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_2
    sub-int/2addr p1, v0

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->G(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->G(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public J(ZILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->d:Z

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->c:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->f:Ljava/util/List;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->e:Z

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->g:Ll/lrc0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/lrc0;->h()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->g:Ll/lrc0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lrc0;->g(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->H(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->h:Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->U:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;->J(Lcom/p1/mobile/putong/core/ui/main/ConversationsPage;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->d:Z

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/main/ConversationsPage$a;->c:I

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    :cond_1
    if-ge p1, v0, :cond_2

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_2
    :goto_0
    return v2
.end method
