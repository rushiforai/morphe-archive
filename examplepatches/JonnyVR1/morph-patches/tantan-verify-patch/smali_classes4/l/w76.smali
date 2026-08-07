.class public Ll/w76;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/LabelParams;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelParams;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/y20;Ll/qcj;)V
    .locals 1
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/qcj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
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
    iput-object v0, p0, Ll/w76;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/w76;->d:Ll/y20;

    .line 12
    .line 13
    iput-object p2, p0, Ll/w76;->e:Ll/qcj;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Ll/w76;Lcom/p1/mobile/putong/core/data/LabelParams;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w76;->I(Lcom/p1/mobile/putong/core/data/LabelParams;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/w76;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LabelParams;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w76;->c:Ljava/util/List;

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
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->C1:I

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

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/LabelParams;II)V
    .locals 2

    .line 1
    sget p3, Ll/adc0;->z6:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

    .line 8
    .line 9
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/LabelParams;->value:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/gra;->z()Z

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    iget-object v0, p0, Ll/w76;->e:Ll/qcj;

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    const-string p4, "#000000"

    .line 38
    .line 39
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    invoke-virtual {p3, p4, v1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->t(II)V

    .line 44
    .line 45
    .line 46
    sget p3, Ll/dbc0;->pf:I

    .line 47
    .line 48
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const-string p4, "#FE7E1D"

    .line 53
    .line 54
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p4

    .line 58
    invoke-virtual {p3, p4, v1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->t(II)V

    .line 59
    .line 60
    .line 61
    sget p3, Ll/dbc0;->wf:I

    .line 62
    .line 63
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    if-eqz p4, :cond_2

    .line 68
    .line 69
    const-string p4, "#66000000"

    .line 70
    .line 71
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result p4

    .line 75
    invoke-virtual {p3, p4, v1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->t(II)V

    .line 76
    .line 77
    .line 78
    sget p3, Ll/dbc0;->qf:I

    .line 79
    .line 80
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    const-string p4, "#33000000"

    .line 85
    .line 86
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p4

    .line 90
    invoke-virtual {p3, p4, v1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->t(II)V

    .line 91
    .line 92
    .line 93
    sget p3, Ll/dbc0;->wf:I

    .line 94
    .line 95
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 96
    .line 97
    .line 98
    :goto_0
    sget p3, Ll/adc0;->x6:I

    .line 99
    .line 100
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance p3, Ll/v76;

    .line 105
    .line 106
    invoke-direct {p3, p0, p2}, Ll/v76;-><init>(Ll/w76;Lcom/p1/mobile/putong/core/data/LabelParams;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public G()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelParams;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w76;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(I)Lcom/p1/mobile/putong/core/data/LabelParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w76;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/data/LabelParams;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w76;->d:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LabelParams;->key:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelParams;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object p1, p0, Ll/w76;->c:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w76;->H(I)Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method
