.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/oun;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;

.field public c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

.field public d:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;

.field public e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

.field public f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;

.field public g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Z

.field public k:Z

.field public l:I

.field public m:Ll/qrr;

.field public n:Ll/oun;

.field public o:Ljava/lang/String;

.field public p:Ll/x20;

.field public q:Landroid/animation/AnimatorSet;

.field public r:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 6
    .line 7
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 17
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 20
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    return-void
.end method

.method private G()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/oun;->j3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0, v0}, Ll/sft;->f(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Ll/ftn;Ll/ftn;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->x(Ll/ftn;Ll/ftn;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->w()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->F()V

    return-void
.end method

.method private setBadgeNum(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    const/16 v1, 0x63

    .line 10
    .line 11
    const/high16 v2, 0x41100000    # 9.0f

    .line 12
    .line 13
    if-ltz p1, :cond_4

    .line 14
    .line 15
    if-gt p1, v1, :cond_4

    .line 16
    .line 17
    const/16 v1, 0xa

    .line 18
    .line 19
    if-ge p1, v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-eqz v1, :cond_1

    .line 25
    .line 26
    sget v3, Ll/qa00;->j:I

    .line 27
    .line 28
    :goto_1
    int-to-float v3, v3

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    goto :goto_1

    .line 35
    :goto_2
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    goto :goto_3

    .line 47
    :cond_2
    sget v3, Ll/qa00;->h:I

    .line 48
    .line 49
    :goto_3
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_4

    .line 62
    :cond_3
    sget v1, Ll/qa00;->h:I

    .line 63
    .line 64
    :goto_4
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 74
    .line 75
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    if-le p1, v1, :cond_5

    .line 84
    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    int-to-float p1, p1

    .line 90
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 94
    .line 95
    sget v0, Ll/qa00;->h:I

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {p1, v0, v1, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 111
    .line 112
    const-string p1, "99+"

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 119
    .line 120
    const/16 p1, 0x8

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 123
    .line 124
    .line 125
    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->k:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->G()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final B(II)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    if-eq p1, v1, :cond_b

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne p1, v2, :cond_0

    .line 7
    .line 8
    goto/16 :goto_5

    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/y6u;->e()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    sget-object v4, Ll/tbs;->b:Ll/vwt;

    .line 15
    .line 16
    invoke-virtual {v4}, Ll/vwt;->s3()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    if-eqz v3, :cond_a

    .line 21
    .line 22
    if-nez v4, :cond_1

    .line 23
    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_1
    if-lez p2, :cond_2

    .line 27
    .line 28
    move v3, v2

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    move v3, v0

    .line 31
    :goto_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/4 v7, -0x1

    .line 43
    sparse-switch v6, :sswitch_data_0

    .line 44
    .line 45
    .line 46
    :goto_1
    move v1, v7

    .line 47
    goto :goto_2

    .line 48
    :sswitch_0
    const-string v6, "liveIcon"

    .line 49
    .line 50
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-nez v5, :cond_5

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :sswitch_1
    const-string v1, "redDot"

    .line 58
    .line 59
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    move v1, v2

    .line 67
    goto :goto_2

    .line 68
    :sswitch_2
    const-string v1, "number"

    .line 69
    .line 70
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_4

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    move v1, v0

    .line 78
    :cond_5
    :goto_2
    packed-switch v1, :pswitch_data_0

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :pswitch_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 83
    .line 84
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    if-eqz v3, :cond_6

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 90
    .line 91
    const-string v5, "LIVE"

    .line 92
    .line 93
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 97
    .line 98
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :pswitch_1
    if-eqz v3, :cond_7

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->H(Z)V

    .line 105
    .line 106
    .line 107
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 108
    .line 109
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 113
    .line 114
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    goto :goto_3

    .line 118
    :pswitch_2
    if-eqz v3, :cond_8

    .line 119
    .line 120
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->H(Z)V

    .line 121
    .line 122
    .line 123
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 124
    .line 125
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->setBadgeNum(I)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 132
    .line 133
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 137
    .line 138
    invoke-virtual {v1, v4, p2}, Ll/oun;->D3(Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 139
    .line 140
    .line 141
    if-nez p1, :cond_9

    .line 142
    .line 143
    if-nez v3, :cond_9

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->needShowActivitiesRedDot()Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_9

    .line 150
    .line 151
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j:Z

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->H(Z)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 157
    .line 158
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    :cond_9
    return-void

    .line 162
    :cond_a
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 163
    .line 164
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 168
    .line 169
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 173
    .line 174
    invoke-virtual {p0, v4, v0}, Ll/oun;->D3(Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_b
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->needShowActivitiesRedDot()Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j:Z

    .line 183
    .line 184
    if-eqz p1, :cond_c

    .line 185
    .line 186
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->H(Z)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 190
    .line 191
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j:Z

    .line 192
    .line 193
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :sswitch_data_0
    .sparse-switch
        -0x3da724b7 -> :sswitch_2
        -0x37b9c108 -> :sswitch_1
        0x547b0b85 -> :sswitch_0
    .end sparse-switch

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final C(IILcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n(I)Ll/ftn;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n(I)Ll/ftn;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz p1, :cond_4

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p1, v1, :cond_3

    .line 13
    .line 14
    const/4 p3, 0x2

    .line 15
    if-eq p1, p3, :cond_2

    .line 16
    .line 17
    const/4 p3, 0x3

    .line 18
    if-eq p1, p3, :cond_1

    .line 19
    .line 20
    const/4 p3, 0x4

    .line 21
    if-eq p1, p3, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;

    .line 25
    .line 26
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 27
    .line 28
    invoke-virtual {p1, p3, p4}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;->Q(Ll/oun;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_5

    .line 38
    .line 39
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->o:Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;

    .line 45
    .line 46
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 47
    .line 48
    invoke-virtual {p1, p3, p4}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;->s(Ll/oun;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_5

    .line 58
    .line 59
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->scheme:Ljava/lang/String;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->o:Ljava/lang/String;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    new-instance p1, Ll/dvn;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Ll/dvn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p:Ll/x20;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    const/4 p1, -0x1

    .line 73
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->B(II)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->d:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;

    .line 77
    .line 78
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 81
    .line 82
    invoke-virtual {p1, p3, p4, v1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->T(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Ll/oun;Ll/qrr;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    new-instance p1, Ll/cvn;

    .line 87
    .line 88
    invoke-direct {p1, p0, p3}, Ll/cvn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p:Ll/x20;

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 94
    .line 95
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 96
    .line 97
    invoke-virtual {p1, p3, p4}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Ll/qrr;)V

    .line 98
    .line 99
    .line 100
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    .line 101
    .line 102
    if-eqz p1, :cond_6

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 105
    .line 106
    .line 107
    :cond_6
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 108
    .line 109
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    .line 113
    .line 114
    new-instance p3, Landroid/view/animation/PathInterpolator;

    .line 115
    .line 116
    const p4, 0x3c23d70a    # 0.01f

    .line 117
    .line 118
    .line 119
    const/high16 v1, 0x3f800000    # 1.0f

    .line 120
    .line 121
    const v2, 0x3ed70a3d    # 0.42f

    .line 122
    .line 123
    .line 124
    const/4 v3, 0x0

    .line 125
    invoke-direct {p3, v2, v3, p4, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 129
    .line 130
    .line 131
    if-eqz p5, :cond_7

    .line 132
    .line 133
    if-eqz p2, :cond_7

    .line 134
    .line 135
    if-eqz v0, :cond_7

    .line 136
    .line 137
    new-instance p1, Ll/evn;

    .line 138
    .line 139
    invoke-direct {p1, p0, p2, v0}, Ll/evn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Ll/ftn;Ll/ftn;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->F()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

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

.method public E(Ll/qrr;)V
    .locals 7
    .param p1    # Ll/qrr;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->y(Ll/qrr;Ll/qrr;)Z

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 8
    .line 9
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Ll/qrr;->g()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iput v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->r:I

    .line 29
    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v0, -0x1

    .line 36
    :goto_0
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j(II)V

    .line 37
    .line 38
    .line 39
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {p1}, Ll/qrr;->e()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    move-object v1, p0

    .line 50
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->C(IILcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/oun;->I3(Ll/qrr;)V

    .line 56
    .line 57
    .line 58
    iput v2, v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 59
    .line 60
    return-void
.end method

.method public final F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p:Ll/x20;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final H(Z)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    move v4, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v4, v2

    .line 22
    :goto_0
    if-eqz p1, :cond_1

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    move v1, v3

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v1, v2

    .line 29
    :goto_1
    if-nez p1, :cond_2

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    move v2, v3

    .line 34
    :cond_2
    if-nez v4, :cond_3

    .line 35
    .line 36
    if-nez v1, :cond_3

    .line 37
    .line 38
    if-eqz v2, :cond_4

    .line 39
    .line 40
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/oun;->j3()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0, p1}, Ll/sft;->f(Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    :cond_4
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getState()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/qrr;->g()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fvn;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/oun;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l(Ll/oun;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j(II)V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x4

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    if-ne p2, v0, :cond_5

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v3

    .line 14
    :goto_0
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->d:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;

    .line 18
    .line 19
    if-ne p1, v2, :cond_1

    .line 20
    .line 21
    move v0, v2

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v0, v3

    .line 24
    :goto_1
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    if-ne p1, v0, :cond_2

    .line 31
    .line 32
    move v0, v2

    .line 33
    goto :goto_2

    .line 34
    :cond_2
    move v0, v3

    .line 35
    :goto_2
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;

    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    if-ne p1, v0, :cond_3

    .line 42
    .line 43
    move v0, v2

    .line 44
    goto :goto_3

    .line 45
    :cond_3
    move v0, v3

    .line 46
    :goto_3
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveEntranceStartLiveView;

    .line 50
    .line 51
    if-ne p1, v1, :cond_4

    .line 52
    .line 53
    move p1, v2

    .line 54
    goto :goto_4

    .line 55
    :cond_4
    move p1, v3

    .line 56
    :goto_4
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    goto :goto_5

    .line 60
    :cond_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n(I)Ll/ftn;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    instance-of p2, p1, Landroid/view/View;

    .line 65
    .line 66
    if-eqz p2, :cond_6

    .line 67
    .line 68
    check-cast p1, Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    :cond_6
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 74
    .line 75
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 79
    .line 80
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    sget p1, Ll/bnl0;->f:I

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->a:Lv/VFrame;

    .line 86
    .line 87
    new-array p2, v2, [Landroid/view/View;

    .line 88
    .line 89
    aput-object p0, p2, v3

    .line 90
    .line 91
    invoke-static {p1, p2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 2
    .line 3
    new-instance v1, Ll/avn;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/avn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->setOnCloseButtonClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/bvn;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/bvn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public l(Ll/oun;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 2
    .line 3
    return-void
.end method

.method public m(Ll/qrr;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ll/qrr;->g()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    if-eq v0, p1, :cond_1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->needShowActivitiesRedDot()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_2
    invoke-virtual {p1}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;->squareDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 29
    .line 30
    if-lez p1, :cond_3

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    :cond_3
    return p0
.end method

.method public final n(I)Ll/ftn;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->d:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 18
    .line 19
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->k()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->h:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->i:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Ll/oun;->F3(ZZ)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/oun;->j3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/sft;->d(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 4

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "clicked, presenter is null :"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ",EntryInfo is null "

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    move v0, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v0, v2

    .line 32
    :goto_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v0, "[live]activityEntry"

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 45
    .line 46
    if-eqz p1, :cond_7

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->m:Ll/qrr;

    .line 49
    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :cond_2
    invoke-virtual {p1, v0}, Ll/oun;->H3(Ll/qrr;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->getState()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    const/4 v0, 0x3

    .line 61
    if-ne p1, v0, :cond_3

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->o:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ll/oun;->m3(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->getState()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    const/4 v3, 0x4

    .line 76
    if-ne p1, v3, :cond_4

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/oun;->K3()V

    .line 81
    .line 82
    .line 83
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->o:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p1, p0}, Ll/ujt;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_4
    invoke-static {v0}, Ll/t4u;->n(I)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->g2(Landroid/content/Context;)Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->p()Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-eqz p1, :cond_5

    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 122
    .line 123
    invoke-virtual {p1}, Ll/oun;->j3()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-static {p1, v1}, Ll/sft;->e(Ljava/lang/String;Z)V

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q()Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_6

    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 138
    .line 139
    invoke-virtual {p1}, Ll/oun;->j3()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p1, v2}, Ll/sft;->e(Ljava/lang/String;Z)V

    .line 144
    .line 145
    .line 146
    :cond_6
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 147
    .line 148
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j:Z

    .line 149
    .line 150
    invoke-virtual {p1, v2, p0}, Ll/oun;->F3(ZZ)V

    .line 151
    .line 152
    .line 153
    :cond_7
    :goto_3
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;->squareDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->B(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic w()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, -0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->B(II)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->j:Z

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->n:Ll/oun;

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryOrigin;->Z(ZLl/oun;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic x(Ll/ftn;Ll/ftn;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->d(Ll/ftn;Ll/ftn;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1, p2}, Ll/ftn;->v(Ll/ftn;)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {p2, p1}, Ll/ftn;->s(Ll/ftn;)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    filled-new-array {v0, p1, v1}, [Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    new-instance p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView$a;

    .line 27
    .line 28
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->q:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final y(Ll/qrr;Ll/qrr;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-eq p1, v1, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq p1, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/qrr;->g()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v1, :cond_1

    .line 17
    .line 18
    iget p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq p1, v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/qrr;->g()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-ne p1, v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->l:I

    .line 31
    .line 32
    invoke-virtual {p2}, Ll/qrr;->g()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eq p0, p1, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    return v0
.end method

.method public z()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
