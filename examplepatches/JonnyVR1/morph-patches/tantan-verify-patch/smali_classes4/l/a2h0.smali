.class public Ll/a2h0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/core/data/GPTopicCard;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GPTopicCard;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/GPTopicCard;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

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
    iput-object v0, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/a2h0;->c:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/a2h0;->e:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 14
    .line 15
    iput-object p3, p0, Ll/a2h0;->f:Ll/y20;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic E(Ll/a2h0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a2h0;->I(Landroid/view/View;)V

    return-void
.end method

.method private H()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/a2h0;->e:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/a2h0;->c:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const-string v0, "see_all"

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_more:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/a2h0;->F(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a2h0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p2, v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/a2h0;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p2, v0, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/kec0;->of:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p2, Ll/kec0;->mf:I

    .line 26
    .line 27
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_1
    iget-object p0, p0, Ll/a2h0;->c:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget p2, Ll/kec0;->nf:I

    .line 39
    .line 40
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V
    .locals 1

    .line 1
    const/4 p4, 0x1

    .line 2
    if-eq p3, p4, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p3, v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;

    .line 8
    .line 9
    iget-object p3, p0, Ll/a2h0;->c:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p4, p0, Ll/a2h0;->e:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 12
    .line 13
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/a2h0;->f:Ll/y20;

    .line 16
    .line 17
    invoke-virtual {p1, p3, p4, p2, p0}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    check-cast p1, Lv/VFrame;

    .line 22
    .line 23
    sget p2, Ll/adc0;->id:I

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Lv/VButton;

    .line 30
    .line 31
    sget p3, Ll/adc0;->jd:I

    .line 32
    .line 33
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lv/VText;

    .line 38
    .line 39
    new-instance p3, Ll/z1h0;

    .line 40
    .line 41
    invoke-direct {p3, p0}, Ll/z1h0;-><init>(Ll/a2h0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/rbb0;->q()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    const/4 p3, 0x0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-static {p2, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    check-cast p1, Lv/VFrame;

    .line 69
    .line 70
    sget p2, Ll/adc0;->kd:I

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lv/VText;

    .line 77
    .line 78
    iget-object p0, p0, Ll/a2h0;->e:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 79
    .line 80
    iget p0, p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;->headerDesc:I

    .line 81
    .line 82
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-le p1, v1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    iget-object p0, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 15
    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    return-object p0
.end method

.method public J(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/a2h0;->d:Ljava/util/List;

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

.method public K(Lcom/p1/mobile/putong/core/data/GPTopicCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a2h0;->e:Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a2h0;->G(I)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p0, Ll/a2h0;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-le p1, v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Ll/a2h0;->H()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x2

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method
