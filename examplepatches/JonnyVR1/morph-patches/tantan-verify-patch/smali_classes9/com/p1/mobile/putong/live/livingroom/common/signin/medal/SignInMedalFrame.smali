.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;,
        Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$c;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VPager;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Landroidx/recyclerview/widget/RecyclerView;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/MedalProgressView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->k(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->m:I

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->m(I)V

    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bcf0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->k:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->k:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->r4(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    if-ge p2, p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 14
    .line 15
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 16
    .line 17
    add-int/lit8 p2, p2, 0x1

    .line 18
    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final m(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->d:Lv/VImage;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-lt v1, v3, :cond_0

    .line 8
    .line 9
    move v1, v3

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v2

    .line 12
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e:Lv/VImage;

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 18
    .line 19
    add-int/lit8 p1, p1, -0x2

    .line 20
    .line 21
    if-gt p0, p1, :cond_1

    .line 22
    .line 23
    move v2, v3

    .line 24
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->m:I

    .line 18
    .line 19
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sub-int/2addr v0, v1

    .line 28
    :goto_0
    if-ltz v0, :cond_1

    .line 29
    .line 30
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;

    .line 37
    .line 38
    iget-boolean v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;->show:Z

    .line 39
    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->m(I)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 60
    .line 61
    invoke-direct {v0, p0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 65
    .line 66
    invoke-virtual {v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 67
    .line 68
    .line 69
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$c;

    .line 70
    .line 71
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 72
    .line 73
    invoke-direct {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$c;-><init>(Ljava/util/List;)V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 77
    .line 78
    invoke-virtual {v4, v3}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 82
    .line 83
    new-instance v4, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;

    .line 84
    .line 85
    invoke-direct {v4, p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v4}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 92
    .line 93
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->l:I

    .line 94
    .line 95
    invoke-virtual {v0, v3, v2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->d:Lv/VImage;

    .line 99
    .line 100
    new-instance v3, Ll/ybf0;

    .line 101
    .line 102
    invoke-direct {v3, p0}, Ll/ybf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e:Lv/VImage;

    .line 109
    .line 110
    new-instance v3, Ll/zbf0;

    .line 111
    .line 112
    invoke-direct {v3, p0, p1}, Ll/zbf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->progress:Ljava/util/List;

    .line 119
    .line 120
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_3

    .line 125
    .line 126
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->progress:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    const/4 v3, 0x2

    .line 133
    if-ne v0, v3, :cond_3

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->i:Lv/VText;

    .line 136
    .line 137
    new-instance v3, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->progress:Ljava/util/List;

    .line 143
    .line 144
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v4, "/"

    .line 152
    .line 153
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->progress:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/MedalProgressView;

    .line 173
    .line 174
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->progress:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    check-cast v3, Ljava/lang/Integer;

    .line 181
    .line 182
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    int-to-float v3, v3

    .line 187
    const/high16 v4, 0x3f800000    # 1.0f

    .line 188
    .line 189
    mul-float/2addr v3, v4

    .line 190
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->progress:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    check-cast v4, Ljava/lang/Integer;

    .line 197
    .line 198
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    int-to-float v4, v4

    .line 203
    div-float/2addr v3, v4

    .line 204
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/MedalProgressView;->setProgress(F)V

    .line 209
    .line 210
    .line 211
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->explainContents:Ljava/util/List;

    .line 212
    .line 213
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_6

    .line 218
    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    :goto_2
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->explainContents:Ljava/util/List;

    .line 225
    .line 226
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    if-ge v2, v3, :cond_5

    .line 231
    .line 232
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->explainContents:Ljava/util/List;

    .line 233
    .line 234
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->explainContents:Ljava/util/List;

    .line 244
    .line 245
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    sub-int/2addr v3, v1

    .line 250
    if-eq v2, v3, :cond_4

    .line 251
    .line 252
    const-string v3, "\n"

    .line 253
    .line 254
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->j:Lv/VText;

    .line 261
    .line 262
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .line 268
    .line 269
    :cond_6
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    invoke-virtual {v0, v2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-direct {v2, v3, v4, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 45
    .line 46
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Jd:I

    .line 47
    .line 48
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->d(IZ)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 52
    .line 53
    new-instance v2, Ll/xbf0;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/xbf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setBackListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setLeftView(I)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setDivider(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
