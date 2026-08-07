.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/x6r;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VLine;

.field public f:Lv/VSwitchButton;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VSwitchButton;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VText;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;

.field public n:Lv/VText;

.field public o:Lv/VImage;

.field public p:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;

.field public q:Landroid/widget/HorizontalScrollView;

.field public r:Lv/VLinear;

.field public s:Lv/VImage;

.field public t:Lv/VImage;

.field public u:Landroid/widget/TextView;

.field public v:Landroid/widget/TextView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public x:Ll/x6r;

.field public y:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->i(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->j(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)Ll/x6r;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/b7r;->b(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Ll/x6r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->y:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/x6r;->Z3(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x6r;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->e(Ll/x6r;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/x6r;->b4(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->t:Lv/VImage;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget p1, Ll/obc0;->J9:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget p1, Ll/obc0;->M9:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public final l()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->a:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->c:Lv/VImage;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->s:Lv/VImage;

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->v:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->u:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->f:Lv/VSwitchButton;

    .line 27
    .line 28
    new-instance v1, Ll/z6r;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/z6r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->i:Lv/VSwitchButton;

    .line 37
    .line 38
    new-instance v1, Ll/a7r;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/a7r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->m:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;

    .line 47
    .line 48
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$a;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->p:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;

    .line 57
    .line 58
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$b;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->getKtvAcoustics()Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x0

    .line 71
    move v2, v1

    .line 72
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-ge v2, v3, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    sget v4, Ll/yec0;->W2:I

    .line 87
    .line 88
    const/4 v5, 0x0

    .line 89
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 94
    .line 95
    invoke-static {}, Ll/bnl0;->y0()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    const/high16 v5, 0x42200000    # 40.0f

    .line 100
    .line 101
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    sub-int/2addr v4, v5

    .line 106
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    add-int/lit8 v5, v5, -0x1

    .line 111
    .line 112
    const/high16 v6, 0x41200000    # 10.0f

    .line 113
    .line 114
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v7

    .line 118
    mul-int/2addr v5, v7

    .line 119
    sub-int/2addr v4, v5

    .line 120
    int-to-float v4, v4

    .line 121
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    int-to-float v5, v5

    .line 126
    const/high16 v7, 0x3f800000    # 1.0f

    .line 127
    .line 128
    mul-float/2addr v5, v7

    .line 129
    div-float/2addr v4, v5

    .line 130
    float-to-int v4, v4

    .line 131
    const/high16 v5, 0x42600000    # 56.0f

    .line 132
    .line 133
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 142
    .line 143
    mul-int/lit8 v7, v4, 0x46

    .line 144
    .line 145
    int-to-float v7, v7

    .line 146
    const/high16 v8, 0x42700000    # 60.0f

    .line 147
    .line 148
    div-float/2addr v7, v8

    .line 149
    float-to-int v7, v7

    .line 150
    invoke-direct {v5, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 151
    .line 152
    .line 153
    if-lez v2, :cond_0

    .line 154
    .line 155
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    goto :goto_1

    .line 160
    :cond_0
    move v4, v1

    .line 161
    :goto_1
    iput v4, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 162
    .line 163
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->r:Lv/VLinear;

    .line 164
    .line 165
    invoke-virtual {v4, v3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 173
    .line 174
    iget v4, v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->preset:I

    .line 175
    .line 176
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v3, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 191
    .line 192
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;->setData(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;)V

    .line 193
    .line 194
    .line 195
    add-int/lit8 v2, v2, 0x1

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_1
    return-void
.end method

.method public m(Ll/xzs;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    new-instance p2, Ll/c0s;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->C0()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p2, p1, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->l()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/x6r;->T3()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->k(Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->m:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/x6r;->R3()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->setProgress(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->p:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;

    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 55
    .line 56
    invoke-virtual {p2}, Ll/x6r;->P3()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->setProgress(I)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->c:Lv/VImage;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eq v0, v1, :cond_5

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->a:Lv/VFrame;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->s:Lv/VImage;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x1

    .line 37
    if-ne v0, v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 40
    .line 41
    if-eqz p0, :cond_6

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/x6r;->T3()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    xor-int/2addr p1, v2

    .line 48
    invoke-virtual {p0, p1}, Ll/x6r;->g4(Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->v:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-ne v0, v1, :cond_2

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/x6r;->X3()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->u:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-ne v0, v1, :cond_3

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/x6r;->e4()V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 88
    .line 89
    if-eqz p0, :cond_6

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 100
    .line 101
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-ne v0, v1, :cond_4

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 109
    .line 110
    if-eqz v0, :cond_6

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->f()V

    .line 113
    .line 114
    .line 115
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 116
    .line 117
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->y:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 118
    .line 119
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;->setSelected(Z)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->x:Ll/x6r;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->y:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Ljava/lang/Integer;

    .line 131
    .line 132
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    invoke-virtual {p1, p0}, Ll/x6r;->Y3(I)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_5
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 141
    .line 142
    if-eqz p0, :cond_6

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 145
    .line 146
    .line 147
    :cond_6
    :goto_1
    return-void
.end method

.method public setAudioEffectPreset(I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->r:Lv/VLinear;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->r:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ne v2, p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/View;->performClick()Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method public setEarClickable(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->f:Lv/VSwitchButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setEarSwitcher(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->f:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setOriginalSwitcher(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->i:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
