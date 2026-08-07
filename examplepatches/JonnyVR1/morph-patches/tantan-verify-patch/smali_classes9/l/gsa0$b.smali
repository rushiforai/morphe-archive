.class public Ll/gsa0$b;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gsa0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Ll/gsa0;


# direct methods
.method public constructor <init>(Ll/gsa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gsa0$b;->b:Ll/gsa0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

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
    iput-object p1, p0, Ll/gsa0$b;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsa0$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    return-object p0
.end method

.method public b(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gsa0$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gsa0$b;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsa0$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gsa0$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

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

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_1

    .line 3
    .line 4
    iget-object p2, p0, Ll/gsa0$b;->b:Ll/gsa0;

    .line 5
    .line 6
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {}, Ll/xra;->w()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    sget v1, Ll/sec0;->B:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget v1, Ll/sec0;->A:I

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance p3, Ll/gsa0$c;

    .line 30
    .line 31
    iget-object v1, p0, Ll/gsa0$b;->b:Ll/gsa0;

    .line 32
    .line 33
    invoke-direct {p3, v1}, Ll/gsa0$c;-><init>(Ll/gsa0;)V

    .line 34
    .line 35
    .line 36
    sget v1, Ll/gdc0;->Y:I

    .line 37
    .line 38
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroid/widget/TextView;

    .line 43
    .line 44
    iput-object v1, p3, Ll/gsa0$c;->a:Landroid/widget/TextView;

    .line 45
    .line 46
    sget v1, Ll/gdc0;->a:I

    .line 47
    .line 48
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Landroid/widget/ImageView;

    .line 53
    .line 54
    iput-object v1, p3, Ll/gsa0$c;->b:Landroid/widget/ImageView;

    .line 55
    .line 56
    sget v1, Ll/gdc0;->z:I

    .line 57
    .line 58
    invoke-virtual {p2, v1, p3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    sget p3, Ll/gdc0;->z:I

    .line 63
    .line 64
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    check-cast p3, Ll/gsa0$c;

    .line 69
    .line 70
    :goto_1
    invoke-virtual {p0, p1}, Ll/gsa0$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v1, p3, Ll/gsa0$c;->b:Landroid/widget/ImageView;

    .line 75
    .line 76
    iget-object p0, p0, Ll/gsa0$b;->b:Ll/gsa0;

    .line 77
    .line 78
    invoke-static {p0}, Ll/gsa0;->a(Ll/gsa0;)Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget v2, Ll/kbc0;->n1:I

    .line 83
    .line 84
    invoke-virtual {p0, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p3, Ll/gsa0$c;->b:Landroid/widget/ImageView;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    const/4 v2, 0x1

    .line 98
    if-nez v1, :cond_2

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    :cond_2
    move v0, v2

    .line 107
    :cond_3
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p3, Ll/gsa0$c;->a:Landroid/widget/TextView;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p3, Ll/gsa0$c;->a:Landroid/widget/TextView;

    .line 120
    .line 121
    const/4 p1, 0x3

    .line 122
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p0, p1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 127
    .line 128
    .line 129
    return-object p2
.end method
