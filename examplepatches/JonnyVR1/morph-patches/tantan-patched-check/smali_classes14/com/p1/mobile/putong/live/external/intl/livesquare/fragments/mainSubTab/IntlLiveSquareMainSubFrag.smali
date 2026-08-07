.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/google/android/material/tabs/TabLayout;

.field public B:Landroid/widget/FrameLayout;

.field public C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

.field public D:Ll/n5o;

.field public E:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

.field public F:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public G:Ljava/lang/String;

.field public H:Ll/x20;

.field public final I:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->F:Ll/y20;

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->G:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->I:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 17
    .line 18
    return-void
.end method

.method private B5(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    :goto_0
    if-ltz v0, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    instance-of v1, v1, Ljava/lang/String;

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-void
.end method

.method private synthetic D5(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->F:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->G:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method private K5(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->H:Ll/x20;

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->L5(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B5(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_2
    :goto_0
    new-instance v0, Ll/j6o;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1, p2}, Ll/j6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->H:Ll/x20;

    .line 29
    .line 30
    return-void
.end method

.method private L5(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v0, v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    instance-of v2, v2, Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v2, :cond_0

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 70
    .line 71
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    add-int/2addr v1, v2

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 85
    .line 86
    invoke-virtual {v2, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Ljava/lang/String;

    .line 99
    .line 100
    if-lez v1, :cond_0

    .line 101
    .line 102
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_0

    .line 107
    .line 108
    new-instance v2, Landroid/widget/ImageView;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    sget v3, Ll/nbc0;->q0:I

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 120
    .line 121
    .line 122
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 123
    .line 124
    sget v4, Ll/qa00;->j:I

    .line 125
    .line 126
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 127
    .line 128
    .line 129
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->B:Landroid/widget/FrameLayout;

    .line 130
    .line 131
    invoke-virtual {v4, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    .line 133
    .line 134
    sget v3, Ll/qa00;->i:I

    .line 135
    .line 136
    sub-int v3, v1, v3

    .line 137
    .line 138
    invoke-static {v2, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_1
    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "square-suggested"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->E5(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V

    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->H5(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic o5()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/mof0;->l(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    return-object v0
.end method

.method public static synthetic p5(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Ll/qrr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->F5(Ll/qrr;)V

    return-void
.end method

.method public static synthetic s5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->G5(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C5(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->D5(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic v5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->E:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    return-object p0
.end method

.method private z5()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/qrr;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gm3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/gm3;->b:Lrx/subjects/a;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public A5()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->D:Ll/n5o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public final synthetic C5(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 4
    .line 5
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    instance-of v2, v2, Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_0

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 88
    .line 89
    invoke-virtual {v2, v1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 90
    .line 91
    .line 92
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    return-void
.end method

.method public final synthetic E5(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 2
    .line 3
    const-string v1, "unknown_"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->I5(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic F5(Ll/qrr;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/qrr;->g()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/qrr;->d()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v1, 0x0

    .line 10
    const-string v2, "square-intlFollowing"

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;->squareDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->unreadCount:I

    .line 25
    .line 26
    if-lez p1, :cond_0

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    :cond_0
    invoke-direct {p0, v2, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->K5(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-direct {p0, v2, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->K5(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic G5(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-ne p1, p2, :cond_1

    .line 8
    .line 9
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/vwt;->I6()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->Y4()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic H5(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->K5(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I5(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->E:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->J5(Lcom/google/android/material/tabs/TabLayout$Tab;Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public final J5(Lcom/google/android/material/tabs/TabLayout$Tab;Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_5

    .line 10
    .line 11
    sget v0, Ll/ldc0;->k2:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->isSelected()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectTextColor:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectTextColor:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 53
    .line 54
    sget v2, Ll/m9c0;->y:I

    .line 55
    .line 56
    invoke-static {v1, v2}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    if-eqz p2, :cond_3

    .line 62
    .line 63
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 64
    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectTextColor:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectTextColor:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    goto :goto_0

    .line 88
    :cond_3
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 89
    .line 90
    sget v2, Ll/m9c0;->g:I

    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    :goto_0
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    if-eqz p2, :cond_5

    .line 100
    .line 101
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 102
    .line 103
    if-eqz p0, :cond_5

    .line 104
    .line 105
    const/4 v1, 0x0

    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectBgColor:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-nez p0, :cond_5

    .line 117
    .line 118
    iget-object p0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 119
    .line 120
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectBgColor:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    sget p2, Ll/qa00;->j:I

    .line 131
    .line 132
    int-to-float p2, p2

    .line 133
    invoke-static {p1, p2, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectBgColor:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-nez p0, :cond_5

    .line 150
    .line 151
    iget-object p0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 152
    .line 153
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 156
    .line 157
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectBgColor:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    sget p2, Ll/qa00;->j:I

    .line 164
    .line 165
    int-to-float p2, p2

    .line 166
    invoke-static {p1, p2, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 171
    .line 172
    .line 173
    :cond_5
    :goto_1
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/n5o;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Y4()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/m6o;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/m6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->F:Ll/y20;

    .line 10
    .line 11
    invoke-static {}, Ll/t4u;->g()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/n6o;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/n6o;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/o6o;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/o6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/p6o;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/p6o;-><init>()V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/q6o;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/q6o;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/r6o;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/r6o;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/s6o;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/s6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->z5()Lrx/subjects/a;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/h6o;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/h6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)V

    .line 99
    .line 100
    .line 101
    new-instance p0, Ll/i6o;

    .line 102
    .line 103
    invoke-direct {p0}, Ll/i6o;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->I:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    sget v0, Ll/l9c0;->n:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setTabGravity(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 25
    .line 26
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Lcom/google/android/material/tabs/TabLayout;->setTabMode(I)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 41
    .line 42
    const/high16 v1, 0x42400000    # 48.0f

    .line 43
    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/vwt;->y5()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    goto/16 :goto_5

    .line 64
    .line 65
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-gt v1, v0, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    move v0, v2

    .line 73
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->y5(Z)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/g6o;

    .line 77
    .line 78
    invoke-direct {v0}, Ll/g6o;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    new-instance p1, Ll/k6o;

    .line 86
    .line 87
    invoke-direct {p1}, Ll/k6o;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v5, p1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    new-instance v3, Ll/n5o;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const/4 v7, 0x0

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    const/4 v6, 0x0

    .line 106
    invoke-direct/range {v3 .. v8}, Ll/n5o;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;IILcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 107
    .line 108
    .line 109
    iput-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->D:Ll/n5o;

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 121
    .line 122
    .line 123
    if-ltz p1, :cond_2

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->D:Ll/n5o;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/n5o;->getCount()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-ge p1, v0, :cond_2

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 136
    .line 137
    .line 138
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-ge v2, p1, :cond_7

    .line 145
    .line 146
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 153
    .line 154
    invoke-virtual {v0, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    if-nez v0, :cond_3

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {v1, p1}, Ll/v9o;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    new-instance v3, Ll/l6o;

    .line 170
    .line 171
    invoke-direct {v3, p0, v2}, Ll/l6o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;I)V

    .line 172
    .line 173
    .line 174
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    if-eqz v3, :cond_4

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    const/4 v3, 0x2

    .line 193
    if-gt p1, v3, :cond_4

    .line 194
    .line 195
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Landroid/view/View;

    .line 200
    .line 201
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    sget v3, Ll/qa00;->C:I

    .line 206
    .line 207
    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 208
    .line 209
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    check-cast v3, Landroid/view/View;

    .line 214
    .line 215
    invoke-virtual {v3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 216
    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_4
    const/high16 p1, 0x41400000    # 12.0f

    .line 220
    .line 221
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    invoke-static {v1, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 226
    .line 227
    .line 228
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    invoke-static {v1, p1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 233
    .line 234
    .line 235
    :goto_2
    sget p1, Ll/ldc0;->k2:I

    .line 236
    .line 237
    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Landroid/widget/TextView;

    .line 242
    .line 243
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->isSelected()Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_5

    .line 248
    .line 249
    sget v0, Ll/hgc0;->f:I

    .line 250
    .line 251
    goto :goto_3

    .line 252
    :cond_5
    sget v0, Ll/hgc0;->g:I

    .line 253
    .line 254
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_6

    .line 259
    .line 260
    invoke-static {p1, v0}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 261
    .line 262
    .line 263
    :cond_6
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 264
    .line 265
    goto :goto_1

    .line 266
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->G:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-nez p1, :cond_8

    .line 273
    .line 274
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->F:Ll/y20;

    .line 275
    .line 276
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->G:Ljava/lang/String;

    .line 277
    .line 278
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->H:Ll/x20;

    .line 282
    .line 283
    if-eqz p0, :cond_9

    .line 284
    .line 285
    invoke-interface {p0}, Ll/x20;->call()V

    .line 286
    .line 287
    .line 288
    :cond_9
    :goto_5
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->x5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_recommend"

    .line 2
    .line 3
    return-object p0
.end method

.method public x5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/t6o;->b(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final y5(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->A:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x1

    .line 16
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->C:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 20
    .line 21
    const/high16 p1, 0x425c0000    # 55.0f

    .line 22
    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
