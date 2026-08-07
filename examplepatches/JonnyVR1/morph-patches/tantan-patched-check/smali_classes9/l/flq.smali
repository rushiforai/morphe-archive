.class public Ll/flq;
.super Ll/mic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mic0<",
        "Ll/olq;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/olq;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/olq;",
            ">;",
            "Ll/y20<",
            "Ll/olq;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/mic0;-><init>(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/flq;->d:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/olq;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/flq;->G(Landroid/view/View;Ll/olq;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/flq;->d:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/yec0;->Z:I

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p0, p1, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    sget p2, Ll/bnl0;->f:I

    .line 15
    .line 16
    sget v0, Ll/qa00;->s:I

    .line 17
    .line 18
    invoke-direct {p1, p2, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public G(Landroid/view/View;Ll/olq;II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/mic0;->A(Landroid/view/View;Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lv/VText;

    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/olq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    const/4 v0, -0x1

    .line 24
    sparse-switch p4, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_0
    const-string p4, "None"

    .line 29
    .line 30
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-nez p3, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v0, 0x2

    .line 38
    goto :goto_0

    .line 39
    :sswitch_1
    const-string p4, "FollowerAndManager"

    .line 40
    .line 41
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-nez p3, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 v0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :sswitch_2
    const-string p4, "Manager"

    .line 51
    .line 52
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    if-nez p3, :cond_2

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const/4 v0, 0x0

    .line 60
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :pswitch_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->O:I

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :pswitch_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E4:I

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :pswitch_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ga:I

    .line 71
    .line 72
    :goto_1
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2}, Ll/olq;->b()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-virtual {p1, p0}, Landroid/view/View;->setSelected(Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :sswitch_data_0
    .sparse-switch
        -0x6afe5873 -> :sswitch_2
        -0x2a55974c -> :sswitch_1
        0x252358 -> :sswitch_0
    .end sparse-switch

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public H(I)Ll/olq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/flq;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/olq;

    .line 8
    .line 9
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/flq;->H(I)Ll/olq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
