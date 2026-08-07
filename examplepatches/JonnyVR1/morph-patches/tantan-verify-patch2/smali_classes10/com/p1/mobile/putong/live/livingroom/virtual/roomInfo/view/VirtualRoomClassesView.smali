.class public Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->c(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)Landroid/view/View;
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x10

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;->isSelected:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 18
    .line 19
    .line 20
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;->isSelected:Z

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->b:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    :cond_0
    sget v1, Ll/obc0;->V6:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/g3m0;

    .line 32
    .line 33
    invoke-direct {v1, p0, v0, p1}, Ll/g3m0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {v1, v2}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 49
    .line 50
    const/high16 v3, 0x41800000    # 16.0f

    .line 51
    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 61
    .line 62
    .line 63
    const/high16 v3, 0x41400000    # 12.0f

    .line 64
    .line 65
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    const-string v2, "context_livingAct"

    .line 75
    .line 76
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;->icon:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v2, v1, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance v1, Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;->name:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    const/high16 p0, 0x41600000    # 14.0f

    .line 96
    .line 97
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 98
    .line 99
    .line 100
    const-string p0, "#66ffffff"

    .line 101
    .line 102
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 110
    .line 111
    sget p1, Ll/bnl0;->f:I

    .line 112
    .line 113
    invoke-direct {p0, p1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 114
    .line 115
    .line 116
    const/high16 p1, 0x40c00000    # 6.0f

    .line 117
    .line 118
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 123
    .line 124
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 129
    .line 130
    invoke-virtual {v0, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    return-object v0
.end method

.method public final synthetic c(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->d(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->b:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eq v0, p1, :cond_2

    .line 10
    .line 11
    :cond_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->b:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->a:Ll/y20;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    move v1, v0

    .line 12
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ge v1, v2, :cond_3

    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 23
    .line 24
    new-instance v3, Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    const/high16 v4, 0x41700000    # 15.0f

    .line 39
    .line 40
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 41
    .line 42
    .line 43
    const-string v4, "#66ffffff"

    .line 44
    .line 45
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 53
    .line 54
    sget v5, Ll/bnl0;->f:I

    .line 55
    .line 56
    invoke-direct {v4, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 57
    .line 58
    .line 59
    if-lez v1, :cond_0

    .line 60
    .line 61
    const/high16 v5, 0x41600000    # 14.0f

    .line 62
    .line 63
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    goto :goto_1

    .line 68
    :cond_0
    move v5, v0

    .line 69
    :goto_1
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 70
    .line 71
    sget v5, Ll/qa00;->e:I

    .line 72
    .line 73
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 74
    .line 75
    invoke-virtual {p0, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    new-instance v3, Lorg/apmem/tools/layouts/FlowLayout;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-direct {v3, v4}, Lorg/apmem/tools/layouts/FlowLayout;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 88
    .line 89
    sget v5, Ll/bnl0;->f:I

    .line 90
    .line 91
    sget v6, Ll/bnl0;->e:I

    .line 92
    .line 93
    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->subClasses:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_1

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_1
    move v4, v0

    .line 109
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-ge v4, v5, :cond_2

    .line 114
    .line 115
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;

    .line 120
    .line 121
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    new-instance v6, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;

    .line 126
    .line 127
    sget v7, Ll/bnl0;->f:I

    .line 128
    .line 129
    sget v8, Ll/qa00;->x:I

    .line 130
    .line 131
    invoke-direct {v6, v7, v8}, Lorg/apmem/tools/layouts/FlowLayout$LayoutParams;-><init>(II)V

    .line 132
    .line 133
    .line 134
    const/high16 v7, 0x40a00000    # 5.0f

    .line 135
    .line 136
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    iput v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 141
    .line 142
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    iput v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 147
    .line 148
    const/high16 v7, 0x41200000    # 10.0f

    .line 149
    .line 150
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    iput v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 155
    .line 156
    invoke-virtual {v3, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .line 158
    .line 159
    add-int/lit8 v4, v4, 0x1

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_2
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_3
    return-void
.end method

.method public setSelectListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomSubClass;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomClassesView;->a:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
