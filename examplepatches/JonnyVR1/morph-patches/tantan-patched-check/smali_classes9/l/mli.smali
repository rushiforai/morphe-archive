.class public Ll/mli;
.super Ll/mic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;"
        }
    .end annotation
.end field

.field public e:I


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/mic0;-><init>(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mli;->d:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic G(Ll/mli;ILcom/p1/mobile/putong/live/base/data/BLiveFilterItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mli;->J(ILcom/p1/mobile/putong/live/base/data/BLiveFilterItem;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/mli;->H(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mli;->d:Ljava/util/List;

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
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/yec0;->N:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;II)V
    .locals 5

    .line 1
    sget p3, Ll/mdc0;->d0:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Landroid/widget/TextView;

    .line 8
    .line 9
    sget v0, Ll/mdc0;->c0:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VDraweeView;

    .line 16
    .line 17
    sget v1, Ll/mdc0;->e0:I

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p0, Ll/mli;->e:I

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    const/4 v4, 0x0

    .line 27
    if-ne p4, v2, :cond_0

    .line 28
    .line 29
    const-string v2, "#ff3a00"

    .line 30
    .line 31
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    invoke-static {v3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string v2, "#383e46"

    .line 50
    .line 51
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    const/16 v2, 0x8

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    invoke-static {v4}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 68
    .line 69
    .line 70
    :goto_0
    sget v1, Ll/mdc0;->j6:I

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-boolean v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->isSuggested:Z

    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    const-string v1, "context_livingAct"

    .line 82
    .line 83
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->icon:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v0, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    new-instance p3, Ll/jli;

    .line 94
    .line 95
    invoke-direct {p3, p0, p4, p2}, Ll/jli;-><init>(Ll/mli;ILcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    const/4 p2, 0x0

    .line 102
    const/high16 p3, 0x41000000    # 8.0f

    .line 103
    .line 104
    if-nez p4, :cond_1

    .line 105
    .line 106
    move v0, p3

    .line 107
    goto :goto_1

    .line 108
    :cond_1
    move v0, p2

    .line 109
    :goto_1
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/mli;->C()I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    sub-int/2addr p0, v3

    .line 121
    if-ne p4, p0, :cond_2

    .line 122
    .line 123
    move p2, p3

    .line 124
    :cond_2
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mli;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic J(ILcom/p1/mobile/putong/live/base/data/BLiveFilterItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/mli;->e:I

    .line 2
    .line 3
    iget-object p1, p0, Ll/mic0;->c:Ll/y20;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/mic0;->c:Ll/y20;

    .line 12
    .line 13
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public K(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/mli;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mli;->I(I)Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
