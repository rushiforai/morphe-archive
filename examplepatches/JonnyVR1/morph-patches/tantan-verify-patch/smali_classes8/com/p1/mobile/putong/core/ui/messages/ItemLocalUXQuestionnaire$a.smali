.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->b:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->z(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic z(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 12
    .line 13
    invoke-interface {v0, p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$c;->a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;I)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, -0x2

    .line 7
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;)Lv/VText;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->b:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;->b(Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 37
    .line 38
    new-instance v0, Ll/s7q;

    .line 39
    .line 40
    invoke-direct {v0, p0, p2}, Ll/s7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public C(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

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
    sget p1, Ll/qec0;->h3:I

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;-><init>(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public D(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$c;

    .line 2
    .line 3
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->b:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->A(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;I)V

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

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->C(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
