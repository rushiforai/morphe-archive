.class public Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/LetterWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/String;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->c:Landroid/content/Context;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;Lcom/p1/mobile/putong/data/LetterWrapper;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->I(Lcom/p1/mobile/putong/data/LetterWrapper;ILandroid/view/View;)V

    return-void
.end method

.method private synthetic I(Lcom/p1/mobile/putong/data/LetterWrapper;ILandroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/LetterWrapper;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/LetterWrapper;->select:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->f:Ll/y20;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->f:Ll/y20;

    .line 35
    .line 36
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    check-cast p3, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 43
    .line 44
    iget-object p3, p3, Lcom/p1/mobile/putong/data/LetterWrapper;->letter:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 64
    .line 65
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/LetterWrapper;->select:Z

    .line 66
    .line 67
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p2, "text"

    .line 72
    .line 73
    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    const-string p0, "e_letter_text_bubble"

    .line 77
    .line 78
    const-string p2, "p_letter_sentmessage_page"

    .line 79
    .line 80
    invoke-static {p0, p2, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->F(Landroid/view/View;Lcom/p1/mobile/putong/data/LetterWrapper;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->Od:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/data/LetterWrapper;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendItem;

    .line 2
    .line 3
    const-string p3, "spotlight_messages"

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const/high16 p3, 0x41700000    # 15.0f

    .line 14
    .line 15
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    invoke-static {p1, p3}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->e:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendItem;->l(Lcom/p1/mobile/putong/data/LetterWrapper;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p3, Ll/pdr;

    .line 35
    .line 36
    invoke-direct {p3, p0, p2, p4}, Ll/pdr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;Lcom/p1/mobile/putong/data/LetterWrapper;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput-boolean v2, v1, Lcom/p1/mobile/putong/data/LetterWrapper;->select:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/data/LetterWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 8
    .line 9
    return-object p0
.end method

.method public J(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->e:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->d:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public K(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->H(I)Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
