.class public Ll/o9i;
.super Landroid/app/Dialog;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lv/VImage;

.field public c:Lv/VImage;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Ll/l4g0;

.field public m:Ll/x20;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:Lv/VImage;

.field public p:Lv/VImage;

.field public q:Lv/VImage;

.field public r:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Ll/fgc0;->n:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/o9i;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p4, p0, Ll/o9i;->m:Ll/x20;

    .line 9
    .line 10
    iput-object p5, p0, Ll/o9i;->r:Ll/y20;

    .line 11
    .line 12
    iput-object p3, p0, Ll/o9i;->n:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    const-class p1, Ll/o9i;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/o9i;->l:Ll/l4g0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/o9i;->h()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ll/o9i;->i(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Ll/o9i;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o9i;->k(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/o9i;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9i;->l(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(ILv/VImage;)V
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(ILv/VImage;)V
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/o9i;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o9i;->j(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/o9i;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o9i;->m(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/o9i;->l:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/o9i;->l:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final g()V
    .locals 10

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/o9i;->g:Lv/VImage;

    .line 18
    .line 19
    sget v1, Ll/lbc0;->Q0:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/o9i;->h:Lv/VImage;

    .line 25
    .line 26
    sget v1, Ll/lbc0;->S0:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/o9i;->i:Lv/VImage;

    .line 32
    .line 33
    sget v1, Ll/lbc0;->R0:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/high16 v1, 0x42200000    # 40.0f

    .line 43
    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/4 v2, 0x2

    .line 49
    mul-int/2addr v1, v2

    .line 50
    sub-int v1, v0, v1

    .line 51
    .line 52
    const/high16 v3, 0x41000000    # 8.0f

    .line 53
    .line 54
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    mul-int/2addr v3, v2

    .line 59
    sub-int/2addr v1, v3

    .line 60
    const/4 v3, 0x3

    .line 61
    div-int/2addr v1, v3

    .line 62
    const/high16 v4, 0x42f80000    # 124.0f

    .line 63
    .line 64
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    mul-int/2addr v4, v1

    .line 69
    const/high16 v5, 0x42ba0000    # 93.0f

    .line 70
    .line 71
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    div-int/2addr v4, v5

    .line 76
    iget-object v5, p0, Ll/o9i;->g:Lv/VImage;

    .line 77
    .line 78
    iget-object v6, p0, Ll/o9i;->h:Lv/VImage;

    .line 79
    .line 80
    iget-object v7, p0, Ll/o9i;->i:Lv/VImage;

    .line 81
    .line 82
    new-array v8, v3, [Landroid/view/View;

    .line 83
    .line 84
    const/4 v9, 0x0

    .line 85
    aput-object v5, v8, v9

    .line 86
    .line 87
    const/4 v5, 0x1

    .line 88
    aput-object v6, v8, v5

    .line 89
    .line 90
    aput-object v7, v8, v2

    .line 91
    .line 92
    invoke-static {v1, v8}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/o9i;->g:Lv/VImage;

    .line 96
    .line 97
    iget-object v6, p0, Ll/o9i;->h:Lv/VImage;

    .line 98
    .line 99
    iget-object v7, p0, Ll/o9i;->i:Lv/VImage;

    .line 100
    .line 101
    filled-new-array {v1, v6, v7}, [Lv/VImage;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v6, Ll/m9i;

    .line 110
    .line 111
    invoke-direct {v6, v4}, Ll/m9i;-><init>(I)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1, v6}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 115
    .line 116
    .line 117
    const/high16 v1, 0x41c00000    # 24.0f

    .line 118
    .line 119
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    mul-int/2addr v0, v1

    .line 124
    const v1, 0x43bb8000    # 375.0f

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    div-int/2addr v0, v1

    .line 132
    iget-object v1, p0, Ll/o9i;->o:Lv/VImage;

    .line 133
    .line 134
    iget-object v4, p0, Ll/o9i;->p:Lv/VImage;

    .line 135
    .line 136
    iget-object v6, p0, Ll/o9i;->q:Lv/VImage;

    .line 137
    .line 138
    new-array v3, v3, [Landroid/view/View;

    .line 139
    .line 140
    aput-object v1, v3, v9

    .line 141
    .line 142
    aput-object v4, v3, v5

    .line 143
    .line 144
    aput-object v6, v3, v2

    .line 145
    .line 146
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Ll/o9i;->o:Lv/VImage;

    .line 150
    .line 151
    iget-object v2, p0, Ll/o9i;->p:Lv/VImage;

    .line 152
    .line 153
    iget-object p0, p0, Ll/o9i;->q:Lv/VImage;

    .line 154
    .line 155
    filled-new-array {v1, v2, p0}, [Lv/VImage;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    new-instance v1, Ll/n9i;

    .line 164
    .line 165
    invoke-direct {v1, v0}, Ll/n9i;-><init>(I)V

    .line 166
    .line 167
    .line 168
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o9i;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/tec0;->o0:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/16 v1, 0x50

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/o9i;->a:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 45
    .line 46
    sget v1, Ll/fgc0;->s:I

    .line 47
    .line 48
    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 6

    .line 1
    sget v0, Ll/hdc0;->w:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VImage;

    .line 8
    .line 9
    iput-object v0, p0, Ll/o9i;->b:Lv/VImage;

    .line 10
    .line 11
    sget v0, Ll/hdc0;->f0:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VImage;

    .line 18
    .line 19
    iput-object v0, p0, Ll/o9i;->c:Lv/VImage;

    .line 20
    .line 21
    sget v0, Ll/hdc0;->U1:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/TextView;

    .line 28
    .line 29
    iput-object v0, p0, Ll/o9i;->d:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v0, Ll/hdc0;->d0:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/widget/TextView;

    .line 38
    .line 39
    iput-object v0, p0, Ll/o9i;->e:Landroid/widget/TextView;

    .line 40
    .line 41
    sget v0, Ll/hdc0;->e0:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 48
    .line 49
    iput-object v0, p0, Ll/o9i;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 50
    .line 51
    sget v0, Ll/hdc0;->g0:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VImage;

    .line 58
    .line 59
    iput-object v0, p0, Ll/o9i;->g:Lv/VImage;

    .line 60
    .line 61
    sget v0, Ll/hdc0;->l0:I

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VImage;

    .line 68
    .line 69
    iput-object v0, p0, Ll/o9i;->h:Lv/VImage;

    .line 70
    .line 71
    sget v0, Ll/hdc0;->k0:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VImage;

    .line 78
    .line 79
    iput-object v0, p0, Ll/o9i;->i:Lv/VImage;

    .line 80
    .line 81
    sget v0, Ll/hdc0;->C:I

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroid/widget/TextView;

    .line 88
    .line 89
    iput-object v0, p0, Ll/o9i;->j:Landroid/widget/TextView;

    .line 90
    .line 91
    sget v0, Ll/hdc0;->h2:I

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Landroid/widget/TextView;

    .line 98
    .line 99
    iput-object v0, p0, Ll/o9i;->k:Landroid/widget/TextView;

    .line 100
    .line 101
    sget v0, Ll/hdc0;->h0:I

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lv/VImage;

    .line 108
    .line 109
    iput-object v0, p0, Ll/o9i;->o:Lv/VImage;

    .line 110
    .line 111
    sget v0, Ll/hdc0;->j0:I

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lv/VImage;

    .line 118
    .line 119
    iput-object v0, p0, Ll/o9i;->p:Lv/VImage;

    .line 120
    .line 121
    sget v0, Ll/hdc0;->i0:I

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lv/VImage;

    .line 128
    .line 129
    iput-object v0, p0, Ll/o9i;->q:Lv/VImage;

    .line 130
    .line 131
    const-string v0, "p_fake_nearby_moment_popup"

    .line 132
    .line 133
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    const-string v1, "\u5979"

    .line 138
    .line 139
    const-string v2, "\u4ed6"

    .line 140
    .line 141
    const-string v3, "\u4e0a\u4f20\u771f\u5b9e\u5934\u50cf\uff0c\u8ba9"

    .line 142
    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    if-eqz v0, :cond_0

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_0

    .line 160
    .line 161
    const/4 v0, 0x1

    .line 162
    goto :goto_0

    .line 163
    :cond_0
    const/4 v0, 0x0

    .line 164
    :goto_0
    iget-object v4, p0, Ll/o9i;->d:Landroid/widget/TextView;

    .line 165
    .line 166
    new-instance v5, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    if-eqz v0, :cond_1

    .line 172
    .line 173
    move-object v1, v2

    .line 174
    :cond_1
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v0, "\u4eec\u4f18\u5148\u770b\u5230\u4f60\u7684\u52a8\u6001"

    .line 178
    .line 179
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    iget-object v3, p0, Ll/o9i;->n:Lcom/p1/mobile/putong/data/User;

    .line 196
    .line 197
    if-eqz v3, :cond_3

    .line 198
    .line 199
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    if-eqz v3, :cond_3

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_3
    move-object v1, v2

    .line 207
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v1, "\u4f18\u5148\u770b\u5230\u4f60\u7684\u8bc4\u8bba"

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    iget-object v1, p0, Ll/o9i;->d:Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    :goto_2
    invoke-virtual {p0}, Ll/o9i;->g()V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Ll/o9i;->b:Lv/VImage;

    .line 228
    .line 229
    new-instance v1, Ll/i9i;

    .line 230
    .line 231
    invoke-direct {v1, p0, p1}, Ll/i9i;-><init>(Ll/o9i;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Ll/o9i;->j:Landroid/widget/TextView;

    .line 238
    .line 239
    new-instance v1, Ll/j9i;

    .line 240
    .line 241
    invoke-direct {v1, p0, p1}, Ll/j9i;-><init>(Ll/o9i;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 245
    .line 246
    .line 247
    iget-object v0, p0, Ll/o9i;->k:Landroid/widget/TextView;

    .line 248
    .line 249
    new-instance v1, Ll/k9i;

    .line 250
    .line 251
    invoke-direct {v1, p0, p1}, Ll/k9i;-><init>(Ll/o9i;Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public final synthetic j(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "e_fake_nearby_comments_close_button"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/o9i;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "e_fake_nearby_comments_publish_button"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/o9i;->m:Ll/x20;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/o9i;->m:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/o9i;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic l(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o9i;->r:Ll/y20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/o9i;->r:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fake_nearby_comments_avatar_button"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p2, p0, Ll/o9i;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    new-instance v0, Ll/l9i;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/l9i;-><init>(Ll/o9i;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1, p2, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->up(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/o9i;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public show()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/o9i;->l:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/o9i;->l:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
