.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->e(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->e(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->e(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Ll/i6t;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-static {p0, p1}, Ll/seg;->e(Ll/i6t;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Ll/i6t;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-static {p0, p1}, Ll/seg;->e(Ll/i6t;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->f(F)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rcs;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/yec0;->o3:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->d(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic f(F)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->e:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    mul-float/2addr p0, p1

    .line 9
    float-to-int v3, p0

    .line 10
    const/4 v4, 0x0

    .line 11
    sget v5, Ll/qa00;->g:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/ynp0;->l(Landroid/view/View;IIIII)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->b:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ocs;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/ocs;-><init>(Ll/i6t;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->c:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/pcs;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/pcs;-><init>(Ll/i6t;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L3:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->f:Lv/VText;

    .line 32
    .line 33
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->grade:J

    .line 34
    .line 35
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->grade:J

    .line 51
    .line 52
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->maxGrade:J

    .line 53
    .line 54
    cmp-long v2, v0, v2

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->g:Lv/VText;

    .line 57
    .line 58
    const-wide/16 v4, 0x1

    .line 59
    .line 60
    if-gez v2, :cond_0

    .line 61
    .line 62
    add-long/2addr v0, v4

    .line 63
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const-string v0, "Max"

    .line 80
    .line 81
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->f:Lv/VText;

    .line 93
    .line 94
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->grade:J

    .line 95
    .line 96
    sub-long/2addr v1, v4

    .line 97
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->h:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->J3:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->current:J

    .line 125
    .line 126
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->max:J

    .line 131
    .line 132
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->current:J

    .line 148
    .line 149
    long-to-float p1, v0

    .line 150
    const/high16 v0, 0x3f800000    # 1.0f

    .line 151
    .line 152
    mul-float/2addr p1, v0

    .line 153
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->max:J

    .line 154
    .line 155
    long-to-float p2, v1

    .line 156
    div-float/2addr p1, p2

    .line 157
    sub-float p1, v0, p1

    .line 158
    .line 159
    cmpl-float p2, p1, v0

    .line 160
    .line 161
    if-lez p2, :cond_1

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_1
    move v0, p1

    .line 165
    :goto_1
    const/4 p1, 0x0

    .line 166
    cmpg-float p2, v0, p1

    .line 167
    .line 168
    if-gez p2, :cond_2

    .line 169
    .line 170
    move v0, p1

    .line 171
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->e:Lv/VImage;

    .line 172
    .line 173
    new-instance p2, Ll/qcs;

    .line 174
    .line 175
    invoke-direct {p2, p0, v0}, Ll/qcs;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;F)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->fanbaseId:Ljava/lang/String;

    .line 8
    .line 9
    const-wide/16 v1, 0x32

    .line 10
    .line 11
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->max:J

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->min:J

    .line 16
    .line 17
    iget v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->grade:I

    .line 18
    .line 19
    int-to-long v3, v3

    .line 20
    iput-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->grade:J

    .line 21
    .line 22
    const-wide/16 v3, 0x14

    .line 23
    .line 24
    iput-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->maxGrade:J

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->userId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->userId:Ljava/lang/String;

    .line 29
    .line 30
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->current:J

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public i(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->f:Lv/VText;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->g:Lv/VText;

    .line 9
    .line 10
    xor-int/lit8 v1, p1, 0x1

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->h:Lv/VText;

    .line 16
    .line 17
    xor-int/lit8 v1, p1, 0x1

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->e:Lv/VImage;

    .line 23
    .line 24
    xor-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
