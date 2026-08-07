.class public Ll/x9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/q9v;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/q9v;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Ll/p2u;


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 5
    .line 6
    iput-object p2, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/x9v;->r()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/x9v;->d()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/x9v;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/x9v;->j(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static bridge synthetic c(Ll/x9v;)Ll/q9v;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x9v;->a:Ll/q9v;

    return-object p0
.end method

.method private d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    new-instance v1, Ll/x9v$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/x9v$a;-><init>(Ll/x9v;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic j(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x9v;->a:Ll/q9v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q9v;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/q9v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x9v;->a:Ll/q9v;

    .line 2
    .line 3
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/xec0;->u:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getTabId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget p1, Ll/ldc0;->k2:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q9v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x9v;->e(Ll/q9v;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x9v;->a:Ll/q9v;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/q9v;->r2()Ll/nus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/y6u;->c(Landroidx/fragment/app/FragmentManager;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/p2u;

    .line 17
    .line 18
    iget-object v1, p0, Ll/x9v;->a:Ll/q9v;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/q9v;->r2()Ll/nus;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1, p3}, Ll/p2u;-><init>(Ll/nus;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/x9v;->d:Ll/p2u;

    .line 28
    .line 29
    iget-object p3, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p3, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 40
    .line 41
    .line 42
    iget-object p3, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 43
    .line 44
    iget-object v0, p0, Ll/x9v;->d:Ll/p2u;

    .line 45
    .line 46
    invoke-virtual {p3, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    iget-object v0, p0, Ll/x9v;->d:Ll/p2u;

    .line 54
    .line 55
    invoke-virtual {v0, p3}, Ll/p2u;->q(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/x9v;->d:Ll/p2u;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/cf60;->notifyDataSetChanged()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/r9v;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/r9v;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-ltz v0, :cond_0

    .line 77
    .line 78
    iget-object v1, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 81
    .line 82
    .line 83
    :cond_0
    if-eqz p2, :cond_1

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance v0, Ll/v9v;

    .line 90
    .line 91
    invoke-direct {v0, p2}, Ll/v9v;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-ltz p1, :cond_1

    .line 99
    .line 100
    iget-object p2, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 101
    .line 102
    invoke-virtual {p2, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 103
    .line 104
    .line 105
    :cond_1
    iget-object p1, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 106
    .line 107
    new-instance p2, Ll/x9v$b;

    .line 108
    .line 109
    invoke-direct {p2, p0}, Ll/x9v$b;-><init>(Ll/x9v;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 113
    .line 114
    .line 115
    const/4 p1, 0x0

    .line 116
    move p2, p1

    .line 117
    :goto_0
    iget-object v0, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-ge p2, v0, :cond_5

    .line 124
    .line 125
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;

    .line 130
    .line 131
    iget-object v1, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 132
    .line 133
    invoke-virtual {v1, p2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {p0}, Ll/x9v;->act()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {p0, v2, v0}, Ll/x9v;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    new-instance v2, Ll/w9v;

    .line 146
    .line 147
    invoke-direct {v2, p0, p2}, Ll/w9v;-><init>(Ll/x9v;I)V

    .line 148
    .line 149
    .line 150
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    if-eqz v1, :cond_2

    .line 154
    .line 155
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 156
    .line 157
    .line 158
    :cond_2
    invoke-virtual {p0}, Ll/x9v;->f()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-ne p2, v1, :cond_3

    .line 163
    .line 164
    const/4 v1, 0x1

    .line 165
    goto :goto_1

    .line 166
    :cond_3
    move v1, p1

    .line 167
    :goto_1
    sget v2, Ll/ldc0;->k2:I

    .line 168
    .line 169
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 174
    .line 175
    .line 176
    if-eqz v1, :cond_4

    .line 177
    .line 178
    sget v1, Ll/ldc0;->k2:I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Landroid/widget/TextView;

    .line 185
    .line 186
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 189
    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_4
    sget v1, Ll/ldc0;->k2:I

    .line 193
    .line 194
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Landroid/widget/TextView;

    .line 199
    .line 200
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 203
    .line 204
    .line 205
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_5
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/x9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    sget v1, Ll/l9c0;->n:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/x9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 16
    .line 17
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
