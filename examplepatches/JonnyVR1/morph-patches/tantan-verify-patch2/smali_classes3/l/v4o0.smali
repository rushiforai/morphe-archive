.class public Ll/v4o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/t4o0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lcom/google/android/material/tabs/TabLayout;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

.field public g:Ll/t4o0;

.field public h:Ll/c0s;

.field public final i:[Landroid/widget/TextView;

.field public j:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object v0, p0, Ll/v4o0;->i:[Landroid/widget/TextView;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/v4o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v4o0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/v4o0;)Ll/t4o0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v4o0;->g:Ll/t4o0;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/v4o0;)[Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v4o0;->i:[Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/v4o0;Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v4o0;->j(Landroid/widget/TextView;Z)V

    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v4o0;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v4o0;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/u4o0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/u4o0;-><init>(Ll/v4o0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/v4o0;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/t4o0;->M3(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v4o0;->h:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/v4o0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/v4o0;->b:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-static {}, Ll/bnl0;->w0()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    div-int/lit8 v2, v2, 0x3

    .line 27
    .line 28
    mul-int/lit8 v2, v2, 0x2

    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/c0s;

    .line 34
    .line 35
    iget-object v2, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 36
    .line 37
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/v4o0;->h:Ll/c0s;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/v4o0;->l()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/v4o0;->m()V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Ll/v4o0;->p()V

    .line 49
    .line 50
    .line 51
    :cond_0
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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/w4o0;->b(Ll/v4o0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/t4o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v4o0;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t4o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v4o0;->f(Ll/t4o0;)V

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

.method public final j(Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/n9c0;->h1:I

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/high16 p2, 0x41800000    # 16.0f

    .line 14
    .line 15
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    int-to-float p2, p2

    .line 20
    invoke-static {p0, p2}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p2, Ll/n9c0;->p1:I

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget p2, Ll/n9c0;->m1:I

    .line 50
    .line 51
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    :goto_0
    const/4 p0, 0x0

    .line 59
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v4o0;->h:Ll/c0s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/v4o0;->h:Ll/c0s;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/v4o0;->h:Ll/c0s;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/v4o0;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 2
    .line 3
    new-instance v1, Ll/vrp;

    .line 4
    .line 5
    iget-object v2, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v3, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 12
    .line 13
    invoke-virtual {v3}, Ll/t4o0;->K3()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-direct {v1, v2, v3}, Ll/vrp;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/v4o0;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    iget-object v1, p0, Ll/v4o0;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/v4o0;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 31
    .line 32
    new-instance v1, Ll/v4o0$a;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/v4o0$a;-><init>(Ll/v4o0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final m()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yi:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xi:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    move v2, v1

    .line 31
    :goto_0
    iget-object v3, p0, Ll/v4o0;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-ge v2, v3, :cond_3

    .line 38
    .line 39
    iget-object v3, p0, Ll/v4o0;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 40
    .line 41
    invoke-virtual {v3, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    if-nez v3, :cond_0

    .line 46
    .line 47
    iget-object v3, p0, Ll/v4o0;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object v4, p0, Ll/v4o0;->e:Lcom/google/android/material/tabs/TabLayout;

    .line 54
    .line 55
    invoke-virtual {v4, v3}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    aget-object v4, v0, v2

    .line 59
    .line 60
    new-instance v5, Landroid/widget/TextView;

    .line 61
    .line 62
    iget-object v6, p0, Ll/v4o0;->g:Ll/t4o0;

    .line 63
    .line 64
    invoke-virtual {v6}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    const/high16 v6, 0x41600000    # 14.0f

    .line 72
    .line 73
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 74
    .line 75
    .line 76
    const/high16 v6, 0x42000000    # 32.0f

    .line 77
    .line 78
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setHeight(I)V

    .line 83
    .line 84
    .line 85
    const/4 v6, -0x2

    .line 86
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setWidth(I)V

    .line 87
    .line 88
    .line 89
    const/16 v6, 0x11

    .line 90
    .line 91
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 92
    .line 93
    .line 94
    const/high16 v6, 0x41400000    # 12.0f

    .line 95
    .line 96
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    invoke-virtual {v5, v7, v1, v6, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3, v5}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    instance-of v6, v3, Landroid/view/View;

    .line 118
    .line 119
    if-eqz v6, :cond_1

    .line 120
    .line 121
    check-cast v3, Landroid/view/View;

    .line 122
    .line 123
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    invoke-virtual {v5, v7, v8}, Landroid/view/View;->measure(II)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    invoke-virtual {v7, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    const/high16 v7, 0x41c00000    # 24.0f

    .line 147
    .line 148
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    int-to-float v7, v7

    .line 153
    add-float/2addr v4, v7

    .line 154
    float-to-int v4, v4

    .line 155
    iput v4, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 156
    .line 157
    invoke-virtual {v3, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    :cond_1
    iget-object v3, p0, Ll/v4o0;->i:[Landroid/widget/TextView;

    .line 161
    .line 162
    aput-object v5, v3, v2

    .line 163
    .line 164
    if-nez v2, :cond_2

    .line 165
    .line 166
    const/4 v3, 0x1

    .line 167
    goto :goto_1

    .line 168
    :cond_2
    move v3, v1

    .line 169
    :goto_1
    invoke-virtual {p0, v5, v3}, Ll/v4o0;->j(Landroid/widget/TextView;Z)V

    .line 170
    .line 171
    .line 172
    add-int/lit8 v2, v2, 0x1

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_3
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/v4o0;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/v4o0;->h:Ll/c0s;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/v4o0;->h:Ll/c0s;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Ll/v4o0;->j:Z

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/v4o0;->j:Z

    .line 25
    .line 26
    :cond_0
    return-void
.end method
