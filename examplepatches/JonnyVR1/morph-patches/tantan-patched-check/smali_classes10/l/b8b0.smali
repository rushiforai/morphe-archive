.class public Ll/b8b0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
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
    iput-object v0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic E(Ll/b8b0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/b8b0;->H(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic H(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/b8b0;->c:Ll/y20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/b8b0;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8b0;->d:Ljava/util/List;

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
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/yec0;->l:I

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
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;II)V
    .locals 3

    .line 1
    sget p2, Ll/mdc0;->T2:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lv/VDraweeView;

    .line 8
    .line 9
    sget p3, Ll/mdc0;->t7:I

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    check-cast p3, Landroid/widget/TextView;

    .line 16
    .line 17
    sget v0, Ll/obc0;->J8:I

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->iconUrl:Ljava/lang/String;

    .line 31
    .line 32
    sget v1, Ll/qa00;->x:I

    .line 33
    .line 34
    const-string v2, "context_single_room"

    .line 35
    .line 36
    invoke-static {v2, p2, v0, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/a8b0;

    .line 40
    .line 41
    invoke-direct {p2, p0, p4}, Ll/a8b0;-><init>(Ll/b8b0;I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->description:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    sget p2, Ll/qa00;->m:I

    .line 61
    .line 62
    iget-object p0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    add-int/lit8 p0, p0, -0x1

    .line 69
    .line 70
    const/4 p3, 0x0

    .line 71
    if-ne p4, p0, :cond_0

    .line 72
    .line 73
    move p0, p2

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    move p0, p3

    .line 76
    :goto_0
    invoke-virtual {p1, p2, p3, p0, p3}, Landroid/view/View;->setPadding(IIII)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ll/y20;)V
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
    iput-object p1, p0, Ll/b8b0;->c:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/b8b0;->d:Ljava/util/List;

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8b0;->G(I)Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
