.class public Ll/j90;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/g90;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ljava/lang/Runnable;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Z)V
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
    iput-object v0, p0, Ll/j90;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/j90;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-boolean p2, p0, Ll/j90;->g:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Ll/j90;Ll/g90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/j90;->J(Ll/g90;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/j90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j90;->I(Landroid/view/View;)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_poi_noshow"

    .line 2
    .line 3
    const-string v0, "p_poi_list_pop"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/j90;->e:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic J(Ll/g90;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "poitype"

    .line 2
    .line 3
    const-string v0, "nearby"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_poi"

    .line 14
    .line 15
    const-string v1, "p_poi_list_pop"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/j90;->f:Ll/y20;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/g90;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/j90;->G(Landroid/view/View;Ll/g90;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j90;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean p0, p0, Ll/j90;->g:Z

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    :goto_0
    return v0

    .line 15
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/j90;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p2, Ll/tec0;->m4:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget p2, Ll/tec0;->n4:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public G(Landroid/view/View;Ll/g90;II)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_1

    .line 3
    .line 4
    move-object p2, p1

    .line 5
    check-cast p2, Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Landroid/widget/TextView;

    .line 12
    .line 13
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->F3:I

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/j4h;->h()Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-eqz p3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    sget p4, Ll/k9c0;->i:I

    .line 29
    .line 30
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    new-instance p2, Ll/h90;

    .line 38
    .line 39
    invoke-direct {p2, p0}, Ll/h90;-><init>(Ll/j90;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    move-object p3, p1

    .line 47
    check-cast p3, Landroid/view/ViewGroup;

    .line 48
    .line 49
    sget v1, Ll/hdc0;->J0:I

    .line 50
    .line 51
    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Landroid/widget/TextView;

    .line 56
    .line 57
    invoke-virtual {p0, p4}, Ll/j90;->H(I)Ll/g90;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Ll/g90;->c()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    sget v2, Ll/hdc0;->I0:I

    .line 69
    .line 70
    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {p0, p4}, Ll/j90;->H(I)Ll/g90;

    .line 77
    .line 78
    .line 79
    move-result-object p4

    .line 80
    invoke-virtual {p4}, Ll/g90;->a()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p4

    .line 84
    invoke-virtual {v2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/j4h;->h()Z

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    if-eqz p4, :cond_2

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    sget v3, Ll/k9c0;->g:I

    .line 98
    .line 99
    invoke-virtual {p4, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 100
    .line 101
    .line 102
    move-result p4

    .line 103
    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object p4

    .line 110
    sget v1, Ll/k9c0;->h:I

    .line 111
    .line 112
    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result p4

    .line 116
    invoke-virtual {v2, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 117
    .line 118
    .line 119
    :cond_2
    sget p4, Ll/hdc0;->K0:I

    .line 120
    .line 121
    invoke-virtual {p3, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    check-cast p3, Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    new-instance p3, Ll/i90;

    .line 131
    .line 132
    invoke-direct {p3, p0, p2}, Ll/i90;-><init>(Ll/j90;Ll/g90;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public H(I)Ll/g90;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/j90;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 7
    .line 8
    :goto_0
    iget-object p0, p0, Ll/j90;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/g90;

    .line 15
    .line 16
    return-object p0
.end method

.method public K(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/j90;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/j90;->c:Ljava/util/List;

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

.method public L(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j90;->e:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public M(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/g90;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j90;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j90;->H(I)Ll/g90;

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
    iget-boolean p0, p0, Ll/j90;->g:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    return v0
.end method
