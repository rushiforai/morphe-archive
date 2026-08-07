.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "square-suggested"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "e_live_top_tab"

    .line 24
    .line 25
    const-string v1, "p_audio_explore_recommend"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 31
    .line 32
    sget v1, Ll/ldc0;->k2:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-static {v1, v2}, Ll/t4u;->q(Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    sget v1, Ll/ggc0;->e:I

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 60
    .line 61
    sget v2, Ll/nbc0;->m:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 75
    .line 76
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 81
    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 85
    .line 86
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectBgColor:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_2

    .line 101
    .line 102
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 105
    .line 106
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectBgColor:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    sget v2, Ll/qa00;->j:I

    .line 121
    .line 122
    int-to-float v2, v2

    .line 123
    const/4 v3, 0x0

    .line 124
    invoke-static {v1, v2, v3}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    if-eqz v0, :cond_3

    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 134
    .line 135
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectTextColor:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-nez p1, :cond_3

    .line 150
    .line 151
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 152
    .line 153
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->selectTextColor:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 168
    .line 169
    .line 170
    :cond_3
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 2
    .line 3
    sget v1, Ll/ldc0;->k2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/TextView;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 15
    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1, v2}, Ll/t4u;->q(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    sget v1, Ll/ggc0;->f:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectTextColor:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_1

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectTextColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_0

    .line 90
    :cond_1
    const/4 v1, -0x1

    .line 91
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectBgColor:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_3

    .line 111
    .line 112
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag$a;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 115
    .line 116
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->subTabConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSubTabConfig;->unSelectBgColor:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    sget v0, Ll/qa00;->j:I

    .line 131
    .line 132
    int-to-float v0, v0

    .line 133
    invoke-static {p0, v0, v2}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    :cond_3
    return-void
.end method
