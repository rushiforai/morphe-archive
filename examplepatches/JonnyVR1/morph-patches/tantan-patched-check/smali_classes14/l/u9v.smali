.class public Ll/u9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/o9v;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/o9v;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Ll/p2u;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/u9v;->r()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/u9v;->e()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Ljava/lang/Boolean;
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

.method public static synthetic b(Ll/u9v;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u9v;->k(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/u9v;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u9v;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/u9v;)Ll/o9v;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u9v;->a:Ll/o9v;

    return-object p0
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
    iget-object p0, p0, Ll/u9v;->a:Ll/o9v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o9v;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    new-instance v1, Ll/u9v$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/u9v$a;-><init>(Ll/u9v;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(Ll/o9v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u9v;->a:Ll/o9v;

    .line 2
    .line 3
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/o9v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u9v;->f(Ll/o9v;)V

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

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/xec0;->t:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getTabId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget v1, Ll/ldc0;->k2:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    sget v2, Ll/ldc0;->m1:I

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Landroid/widget/ImageView;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->getBubble()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    const/4 v3, 0x0

    .line 51
    if-nez p2, :cond_0

    .line 52
    .line 53
    sget-object p2, Ll/htd0;->f:Ll/htd0;

    .line 54
    .line 55
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Ll/civ;

    .line 60
    .line 61
    invoke-virtual {p2, v0}, Ll/civ;->e(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-eqz p2, :cond_0

    .line 66
    .line 67
    iput-object v0, p0, Ll/u9v;->e:Ljava/lang/String;

    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    invoke-static {v2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 78
    .line 79
    .line 80
    return-object p1
.end method

.method public final synthetic k(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V
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
    iput-object p1, p0, Ll/u9v;->f:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    iget-object v0, p0, Ll/u9v;->a:Ll/o9v;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/o9v;->r2()Ll/nus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/y6u;->c(Landroidx/fragment/app/FragmentManager;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/p2u;

    .line 19
    .line 20
    iget-object v1, p0, Ll/u9v;->a:Ll/o9v;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/o9v;->r2()Ll/nus;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, v1, p3}, Ll/p2u;-><init>(Ll/nus;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/u9v;->d:Ll/p2u;

    .line 30
    .line 31
    iget-object p3, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p3, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 42
    .line 43
    .line 44
    iget-object p3, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 45
    .line 46
    iget-object v0, p0, Ll/u9v;->d:Ll/p2u;

    .line 47
    .line 48
    invoke-virtual {p3, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 49
    .line 50
    .line 51
    iget-object p3, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 52
    .line 53
    new-instance v0, Ll/u9v$b;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Ll/u9v$b;-><init>(Ll/u9v;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p3, v0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    iget-object v0, p0, Ll/u9v;->d:Ll/p2u;

    .line 66
    .line 67
    invoke-virtual {v0, p3}, Ll/p2u;->q(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/u9v;->d:Ll/p2u;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/cf60;->notifyDataSetChanged()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/r9v;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/r9v;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-ltz v0, :cond_0

    .line 89
    .line 90
    iget-object v1, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 93
    .line 94
    .line 95
    :cond_0
    if-eqz p2, :cond_1

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance v0, Ll/s9v;

    .line 102
    .line 103
    invoke-direct {v0, p2}, Ll/s9v;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-ltz p1, :cond_1

    .line 111
    .line 112
    iget-object p2, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 113
    .line 114
    invoke-virtual {p2, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 115
    .line 116
    .line 117
    :cond_1
    const/4 p1, 0x0

    .line 118
    move p2, p1

    .line 119
    :goto_0
    iget-object v0, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-ge p2, v0, :cond_5

    .line 126
    .line 127
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;

    .line 132
    .line 133
    iget-object v1, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 134
    .line 135
    invoke-virtual {v1, p2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {p0}, Ll/u9v;->act()Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {p0, v2, v0}, Ll/u9v;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v2, Ll/t9v;

    .line 148
    .line 149
    invoke-direct {v2, p0, p2}, Ll/t9v;-><init>(Ll/u9v;I)V

    .line 150
    .line 151
    .line 152
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    if-eqz v1, :cond_2

    .line 156
    .line 157
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 158
    .line 159
    .line 160
    :cond_2
    invoke-virtual {p0}, Ll/u9v;->i()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-ne p2, v1, :cond_3

    .line 165
    .line 166
    const/4 v1, 0x1

    .line 167
    goto :goto_1

    .line 168
    :cond_3
    move v1, p1

    .line 169
    :goto_1
    sget v2, Ll/ldc0;->k2:I

    .line 170
    .line 171
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 176
    .line 177
    .line 178
    if-eqz v1, :cond_4

    .line 179
    .line 180
    sget v1, Ll/ldc0;->k2:I

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Landroid/widget/TextView;

    .line 187
    .line 188
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 191
    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_4
    sget v1, Ll/ldc0;->k2:I

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Landroid/widget/TextView;

    .line 201
    .line 202
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 205
    .line 206
    .line 207
    :goto_2
    add-int/lit8 p2, p2, 0x1

    .line 208
    .line 209
    goto :goto_0

    .line 210
    :cond_5
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/u9v;->b:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    sget v1, Ll/l9c0;->n:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/u9v;->c:Lcom/google/android/material/tabs/TabLayout;

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
