.class public Ll/sm10;
.super Ll/a8t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a8t<",
        "Ll/qo10;",
        ">;"
    }
.end annotation


# instance fields
.field public q:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

.field public r:I

.field public s:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a8t;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/a8t;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Ll/sm10;->H(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/a8t;->k:Lv/VText;

    .line 2
    .line 3
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 4
    .line 5
    iget v1, p0, Ll/sm10;->r:I

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "%ds"

    .line 16
    .line 17
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Ll/sm10;->H(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 29
    .line 30
    check-cast p1, Ll/qo10;

    .line 31
    .line 32
    iget-object v0, p0, Ll/a8t;->m:Lv/VSwitch;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget p0, p0, Ll/sm10;->r:I

    .line 39
    .line 40
    invoke-virtual {p1, v0, p0}, Ll/qo10;->X3(ZI)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/sm10;->H(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic v(Ll/sm10;Lcom/p1/mobile/putong/ui/datepicker/WheelView;Ll/s01;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/sm10;->A(Lcom/p1/mobile/putong/ui/datepicker/WheelView;Ll/s01;I)V

    return-void
.end method

.method public static synthetic w(Ll/sm10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sm10;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/sm10;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sm10;->F(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic y(Ll/sm10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sm10;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/sm10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sm10;->E(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/ui/datepicker/WheelView;Ll/s01;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sm10;->q:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->durations:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;

    .line 10
    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;->duration:I

    .line 12
    .line 13
    iput p1, p0, Ll/sm10;->r:I

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sm10;->q:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->rejectInvite:Z

    .line 4
    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 8
    .line 9
    check-cast p1, Ll/qo10;

    .line 10
    .line 11
    iget p0, p0, Ll/sm10;->r:I

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Ll/qo10;->X3(ZI)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/sm10;->q:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    .line 2
    .line 3
    iget-object v0, p0, Ll/a8t;->m:Lv/VSwitch;

    .line 4
    .line 5
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->rejectInvite:Z

    .line 6
    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->durations:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->durations:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;

    .line 38
    .line 39
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;->duration:I

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v3, "s"

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->durations:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;

    .line 63
    .line 64
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;->picked:Z

    .line 65
    .line 66
    if-eqz v2, :cond_0

    .line 67
    .line 68
    iput v1, p0, Ll/sm10;->s:I

    .line 69
    .line 70
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->durations:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;

    .line 77
    .line 78
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;->duration:I

    .line 79
    .line 80
    iput v2, p0, Ll/sm10;->r:I

    .line 81
    .line 82
    iget-object v2, p0, Ll/a8t;->k:Lv/VText;

    .line 83
    .line 84
    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 85
    .line 86
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->durations:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;

    .line 93
    .line 94
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDuring;->duration:I

    .line 95
    .line 96
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    const-string v5, "%ds"

    .line 105
    .line 106
    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    iget-object p1, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setData(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 122
    .line 123
    iget p0, p0, Ll/sm10;->s:I

    .line 124
    .line 125
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setSelectedPosition(I)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final H(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a8t;->h:Lv/VText;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move v3, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v3, v1

    .line 11
    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/a8t;->n:Lv/VFrame;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    move v1, v2

    .line 19
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/a8t;->g:Lv/VText;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    const-string p1, "PK\u65f6\u957f"

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_2
    const-string p1, "PK\u8bbe\u7f6e"

    .line 30
    .line 31
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 5
    .line 6
    iget-object v1, p0, Ll/a8t;->n:Lv/VFrame;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget v2, Ll/n9c0;->i1:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setNormalTextColor(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 22
    .line 23
    iget-object v1, p0, Ll/a8t;->n:Lv/VFrame;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget v2, Ll/n9c0;->p1:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setSelectedTextColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 39
    .line 40
    const/high16 v1, 0x41900000    # 18.0f

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setTextSize(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 46
    .line 47
    const/high16 v1, 0x420c0000    # 35.0f

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setLineSpacing(F)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/a8t;->o:Landroid/view/View;

    .line 53
    .line 54
    const/16 v1, 0xa

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/a8t;->p:Lcom/p1/mobile/putong/ui/datepicker/ex/WheelSecondView;

    .line 60
    .line 61
    new-instance v1, Ll/nm10;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/nm10;-><init>(Ll/sm10;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/datepicker/WheelView;->setOnItemSelectedListener(Ll/pm50;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/a8t;->n:Lv/VFrame;

    .line 70
    .line 71
    const/16 v1, 0x8

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/a8t;->h:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/a8t;->f:Lv/VImage;

    .line 82
    .line 83
    new-instance v1, Ll/om10;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/om10;-><init>(Ll/sm10;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/a8t;->h:Lv/VText;

    .line 92
    .line 93
    new-instance v1, Ll/pm10;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/pm10;-><init>(Ll/sm10;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/a8t;->k:Lv/VText;

    .line 102
    .line 103
    new-instance v1, Ll/qm10;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/qm10;-><init>(Ll/sm10;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/a8t;->m:Lv/VSwitch;

    .line 112
    .line 113
    new-instance v1, Ll/rm10;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/rm10;-><init>(Ll/sm10;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->v:I

    .line 2
    .line 3
    return p0
.end method
