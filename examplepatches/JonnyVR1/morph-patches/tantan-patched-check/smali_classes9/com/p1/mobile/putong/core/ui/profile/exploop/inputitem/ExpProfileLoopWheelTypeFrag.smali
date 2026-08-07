.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public F:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public G:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public H:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

.field public J:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->Z4(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->Y4(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method private synthetic Y4(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->b5(ILjava/lang/Object;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic Z4(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->b5(ILjava/lang/Object;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic a5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->b5(ILjava/lang/Object;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Q2:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->Af:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 17
    .line 18
    sget p2, Ll/adc0;->Bf:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 27
    .line 28
    sget p2, Ll/adc0;->Cf:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 37
    .line 38
    return-object p1
.end method

.method public final b5(ILjava/lang/Object;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->onItemSelected(ILjava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->J:Ll/a30;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-interface {v0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->M4()Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;->b2()Ll/cjf;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/cjf;->p0()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public c5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 7
    .line 8
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getData()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 19
    .line 20
    new-instance v3, Ll/sbk0;

    .line 21
    .line 22
    invoke-direct {v3}, Ll/sbk0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v2, v3}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/String;

    .line 40
    .line 41
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getData()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 60
    .line 61
    new-instance v3, Ll/sbk0;

    .line 62
    .line 63
    invoke-direct {v3}, Ll/sbk0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v2, v3}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 73
    .line 74
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ljava/lang/String;

    .line 81
    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 83
    .line 84
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 87
    .line 88
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData1:Ljava/util/List;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 98
    .line 99
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 109
    .line 110
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->M4()Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;->b2()Ll/cjf;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ll/cjf;->p0()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, p3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public e5(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->J:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getData()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getWheelType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData1:Ljava/util/List;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->I:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->d5(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/util/List;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 48
    .line 49
    new-instance v0, Ll/zjf;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/zjf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 58
    .line 59
    new-instance v0, Ll/akf;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/akf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 68
    .line 69
    new-instance v0, Ll/bkf;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/bkf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->M4()Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;->b2()Ll/cjf;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ll/cjf;->p0()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
