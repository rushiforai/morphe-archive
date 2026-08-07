.class public final Ll/bgg0;
.super Ll/wmg0;
.source "SourceFile"


# static fields
.field public static final v:Ljava/lang/String;


# instance fields
.field public c:I

.field public d:I

.field public final e:Landroid/content/Context;

.field public final f:Landroid/view/View;

.field public final g:Landroid/widget/TextView;

.field public final h:Landroid/widget/ImageView;

.field public final i:Landroid/widget/ProgressBar;

.field public final j:Landroid/view/View;

.field public final k:Landroid/widget/TextView;

.field public final l:Landroid/widget/TextView;

.field public final m:Landroid/view/View;

.field public final n:Landroid/view/View;

.field public final o:Landroid/view/View;

.field public final p:Landroid/widget/TextView;

.field public final q:Landroid/widget/TextView;

.field public final r:Landroid/widget/TextView;

.field public final s:Z

.field public final t:Z

.field public u:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/bgg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/bgg0;->v:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 11

    .line 1
    invoke-direct {p0}, Ll/wmg0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/bgg0;->c:I

    .line 6
    .line 7
    iput v0, p0, Ll/bgg0;->d:I

    .line 8
    .line 9
    sget-object v0, Ll/arg0;->a:Ll/pjg0;

    .line 10
    .line 11
    iget-boolean v1, v0, Ll/pjg0;->b:Z

    .line 12
    .line 13
    iput-boolean v1, p0, Ll/bgg0;->s:Z

    .line 14
    .line 15
    iget-boolean v0, v0, Ll/pjg0;->a:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/bgg0;->t:Z

    .line 18
    .line 19
    iput-object p1, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget v3, Ltech/sud/gip/R$layout;->fsm_mgp_game_loading_layout:I

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, p0, Ll/bgg0;->f:Landroid/view/View;

    .line 33
    .line 34
    sget v3, Ltech/sud/gip/R$id;->reload_btn:I

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/widget/TextView;

    .line 41
    .line 42
    iput-object v3, p0, Ll/bgg0;->g:Landroid/widget/TextView;

    .line 43
    .line 44
    sget v4, Ltech/sud/gip/R$id;->big_loading_pic:I

    .line 45
    .line 46
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    check-cast v4, Landroid/widget/ImageView;

    .line 51
    .line 52
    iput-object v4, p0, Ll/bgg0;->h:Landroid/widget/ImageView;

    .line 53
    .line 54
    sget v5, Ltech/sud/gip/R$id;->loading_progress:I

    .line 55
    .line 56
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Landroid/widget/ProgressBar;

    .line 61
    .line 62
    iput-object v5, p0, Ll/bgg0;->i:Landroid/widget/ProgressBar;

    .line 63
    .line 64
    sget v5, Ltech/sud/gip/R$id;->fsm_mgp_game_loading_progress:I

    .line 65
    .line 66
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    iput-object v5, p0, Ll/bgg0;->j:Landroid/view/View;

    .line 71
    .line 72
    sget v5, Ltech/sud/gip/R$id;->loading_tip:I

    .line 73
    .line 74
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Landroid/widget/TextView;

    .line 79
    .line 80
    iput-object v5, p0, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 81
    .line 82
    sget v6, Ltech/sud/gip/R$id;->loading_tip_result:I

    .line 83
    .line 84
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    check-cast v6, Landroid/widget/TextView;

    .line 89
    .line 90
    iput-object v6, p0, Ll/bgg0;->l:Landroid/widget/TextView;

    .line 91
    .line 92
    sget v7, Ltech/sud/gip/R$id;->loading_panel:I

    .line 93
    .line 94
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    iput-object v7, p0, Ll/bgg0;->m:Landroid/view/View;

    .line 99
    .line 100
    sget v7, Ltech/sud/gip/R$id;->container_progress:I

    .line 101
    .line 102
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    iput-object v7, p0, Ll/bgg0;->n:Landroid/view/View;

    .line 107
    .line 108
    sget v8, Ltech/sud/gip/R$id;->fsm_mgp_container_timeout:I

    .line 109
    .line 110
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    iput-object v8, p0, Ll/bgg0;->o:Landroid/view/View;

    .line 115
    .line 116
    sget v8, Ltech/sud/gip/R$id;->fsm_mgp_tv_timeout_tip:I

    .line 117
    .line 118
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    check-cast v8, Landroid/widget/TextView;

    .line 123
    .line 124
    iput-object v8, p0, Ll/bgg0;->p:Landroid/widget/TextView;

    .line 125
    .line 126
    sget v8, Ltech/sud/gip/R$id;->fsm_mgp_tv_continue_wait:I

    .line 127
    .line 128
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    check-cast v8, Landroid/widget/TextView;

    .line 133
    .line 134
    iput-object v8, p0, Ll/bgg0;->q:Landroid/widget/TextView;

    .line 135
    .line 136
    sget v9, Ltech/sud/gip/R$id;->fsm_mgp_tv_timeout_reload:I

    .line 137
    .line 138
    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Landroid/widget/TextView;

    .line 143
    .line 144
    iput-object v2, p0, Ll/bgg0;->r:Landroid/widget/TextView;

    .line 145
    .line 146
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 147
    .line 148
    .line 149
    move-result-object v9

    .line 150
    if-eqz v9, :cond_1

    .line 151
    .line 152
    iget-object v9, v9, Ll/smg0;->d:LD/Sudif;

    .line 153
    .line 154
    if-nez v9, :cond_0

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_0
    sget-object v10, Ll/utg0;->d:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v9, v10}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v10

    .line 167
    if-eqz v10, :cond_2

    .line 168
    .line 169
    sget v9, Ltech/sud/gip/R$string;->fsm_mgp_loading_reload_game:I

    .line 170
    .line 171
    invoke-virtual {p1, v9}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    goto :goto_1

    .line 180
    :cond_1
    :goto_0
    sget v9, Ltech/sud/gip/R$string;->fsm_mgp_loading_reload_game:I

    .line 181
    .line 182
    invoke-virtual {p1, v9}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v9

    .line 190
    :cond_2
    :goto_1
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    .line 192
    .line 193
    new-instance p1, Ll/ufg0;

    .line 194
    .line 195
    invoke-direct {p1, p0}, Ll/ufg0;-><init>(Ll/bgg0;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    .line 200
    .line 201
    const/4 p1, 0x4

    .line 202
    if-nez v0, :cond_3

    .line 203
    .line 204
    invoke-virtual {v4, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 205
    .line 206
    .line 207
    :cond_3
    if-eqz v1, :cond_4

    .line 208
    .line 209
    invoke-virtual {v7, p1}, Landroid/view/View;->setVisibility(I)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, p1}, Landroid/view/View;->setVisibility(I)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v6, p1}, Landroid/view/View;->setVisibility(I)V

    .line 216
    .line 217
    .line 218
    :cond_4
    new-instance p1, Ll/pwg0;

    .line 219
    .line 220
    invoke-direct {p1, p0}, Ll/pwg0;-><init>(Ll/bgg0;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v8, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    .line 225
    .line 226
    new-instance p1, Ll/jzg0;

    .line 227
    .line 228
    invoke-direct {p1, p0}, Ll/jzg0;-><init>(Ll/bgg0;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bgg0;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Ll/bgg0;->o:Landroid/view/View;

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final b(ILorg/json/JSONObject;)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p1, v1, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x14

    .line 6
    .line 7
    iput p1, p0, Ll/bgg0;->c:I

    .line 8
    .line 9
    iget-object v2, p0, Ll/wmg0;->a:Ll/aog0;

    .line 10
    .line 11
    iget-object v2, v2, Ll/aog0;->a:Ll/dhg0;

    .line 12
    .line 13
    iget-object v2, v2, Ll/dhg0;->w:Ll/iug0;

    .line 14
    .line 15
    const-string v3, "getMgInfo"

    .line 16
    .line 17
    invoke-virtual {v2, v3, p1, p2}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    const/16 p1, 0x28

    .line 24
    .line 25
    iput p1, p0, Ll/bgg0;->c:I

    .line 26
    .line 27
    iget-object v2, p0, Ll/wmg0;->a:Ll/aog0;

    .line 28
    .line 29
    iget-object v2, v2, Ll/aog0;->a:Ll/dhg0;

    .line 30
    .line 31
    iget-object v2, v2, Ll/dhg0;->w:Ll/iug0;

    .line 32
    .line 33
    const-string v3, "downloadCore"

    .line 34
    .line 35
    invoke-virtual {v2, v3, p1, p2}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v2, 0x3

    .line 40
    if-ne p1, v2, :cond_2

    .line 41
    .line 42
    const/16 p1, 0x50

    .line 43
    .line 44
    iput p1, p0, Ll/bgg0;->c:I

    .line 45
    .line 46
    iget-object v2, p0, Ll/wmg0;->a:Ll/aog0;

    .line 47
    .line 48
    iget-object v2, v2, Ll/aog0;->a:Ll/dhg0;

    .line 49
    .line 50
    iget-object v2, v2, Ll/dhg0;->w:Ll/iug0;

    .line 51
    .line 52
    const-string v3, "checkoutGamePackage"

    .line 53
    .line 54
    invoke-virtual {v2, v3, p1, p2}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v2, 0x5

    .line 59
    if-ne p1, v2, :cond_3

    .line 60
    .line 61
    const/16 p1, 0x64

    .line 62
    .line 63
    iput p1, p0, Ll/bgg0;->c:I

    .line 64
    .line 65
    iget-object v2, p0, Ll/wmg0;->a:Ll/aog0;

    .line 66
    .line 67
    iget-object v2, v2, Ll/aog0;->a:Ll/dhg0;

    .line 68
    .line 69
    iget-object v2, v2, Ll/dhg0;->w:Ll/iug0;

    .line 70
    .line 71
    const-string v3, "loadGamePercent"

    .line 72
    .line 73
    invoke-virtual {v2, v3, p1, p2}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/bgg0;->i:Landroid/widget/ProgressBar;

    .line 77
    .line 78
    iget p2, p0, Ll/bgg0;->c:I

    .line 79
    .line 80
    invoke-virtual {p1, p2, v1}, Landroid/widget/ProgressBar;->setProgress(IZ)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/wmg0;->a:Ll/aog0;

    .line 84
    .line 85
    iget p2, p0, Ll/bgg0;->c:I

    .line 86
    .line 87
    iget-object p1, p1, Ll/aog0;->a:Ll/dhg0;

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-virtual {p1, v0, v2, p2, v2}, Ll/dhg0;->b(IIIZ)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/bgg0;->g()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/bgg0;->a()V

    .line 97
    .line 98
    .line 99
    iget p1, p0, Ll/bgg0;->c:I

    .line 100
    .line 101
    invoke-virtual {p0, v2, v1, p1, v2}, Ll/bgg0;->c(IZIZ)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final c(IZIZ)V
    .locals 7

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    iput p3, p0, Ll/bgg0;->d:I

    .line 4
    .line 5
    :cond_0
    iget-object p4, p0, Ll/bgg0;->j:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    if-gtz p4, :cond_1

    .line 12
    .line 13
    iget-object p4, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    iget p4, p4, Landroid/util/DisplayMetrics;->density:F

    .line 24
    .line 25
    const/high16 v0, 0x436a0000    # 234.0f

    .line 26
    .line 27
    mul-float/2addr v0, p4

    .line 28
    const/high16 p4, 0x3f000000    # 0.5f

    .line 29
    .line 30
    add-float/2addr v0, p4

    .line 31
    float-to-int p4, v0

    .line 32
    :cond_1
    const-string v0, " ("

    .line 33
    .line 34
    const-string v1, " (\u066a"

    .line 35
    .line 36
    const-string v2, "fa"

    .line 37
    .line 38
    const-string v3, "ar"

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    const/4 v5, 0x0

    .line 42
    if-nez p1, :cond_c

    .line 43
    .line 44
    mul-int p1, p4, p3

    .line 45
    .line 46
    div-int/lit8 p1, p1, 0x64

    .line 47
    .line 48
    sub-int/2addr p4, p1

    .line 49
    neg-int p1, p4

    .line 50
    sget-object p4, Ll/utg0;->d:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz p4, :cond_6

    .line 53
    .line 54
    invoke-virtual {p4, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p4

    .line 58
    invoke-virtual {p4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_2

    .line 63
    .line 64
    invoke-virtual {p4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p4

    .line 68
    if-eqz p4, :cond_6

    .line 69
    .line 70
    :cond_2
    new-instance p4, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    iget-object v0, v0, Ll/smg0;->a:LD/Sudif;

    .line 82
    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    sget-object v2, Ll/utg0;->d:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_5

    .line 97
    .line 98
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 99
    .line 100
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_loading:I

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    goto :goto_1

    .line 111
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 112
    .line 113
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_loading:I

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    :cond_5
    :goto_1
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string p3, ")"

    .line 133
    .line 134
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    goto :goto_4

    .line 142
    :cond_6
    new-instance p4, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    if-eqz v1, :cond_8

    .line 152
    .line 153
    iget-object v1, v1, Ll/smg0;->a:LD/Sudif;

    .line 154
    .line 155
    if-nez v1, :cond_7

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_7
    sget-object v2, Ll/utg0;->d:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v1, v2}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_9

    .line 169
    .line 170
    iget-object v1, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 171
    .line 172
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_loading:I

    .line 173
    .line 174
    invoke-virtual {v1, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto :goto_3

    .line 183
    :cond_8
    :goto_2
    iget-object v1, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 184
    .line 185
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_loading:I

    .line 186
    .line 187
    invoke-virtual {v1, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    :cond_9
    :goto_3
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string p3, "%)"

    .line 205
    .line 206
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p3

    .line 213
    :goto_4
    if-lez p1, :cond_a

    .line 214
    .line 215
    goto :goto_5

    .line 216
    :cond_a
    move v5, p1

    .line 217
    :goto_5
    iget-object p1, p0, Ll/bgg0;->l:Landroid/widget/TextView;

    .line 218
    .line 219
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    .line 221
    .line 222
    if-eqz p2, :cond_b

    .line 223
    .line 224
    iget-object p1, p0, Ll/bgg0;->l:Landroid/widget/TextView;

    .line 225
    .line 226
    iget-object p2, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 227
    .line 228
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    sget p3, Ltech/sud/gip/R$color;->fsm_mgp_loading_tip_loading:I

    .line 233
    .line 234
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 235
    .line 236
    .line 237
    move-result p2

    .line 238
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 239
    .line 240
    .line 241
    :cond_b
    iget-object p1, p0, Ll/bgg0;->j:Landroid/view/View;

    .line 242
    .line 243
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    instance-of p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 248
    .line 249
    if-eqz p2, :cond_1a

    .line 250
    .line 251
    move-object p2, p1

    .line 252
    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 253
    .line 254
    invoke-virtual {p2, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 255
    .line 256
    .line 257
    iget-object p0, p0, Ll/bgg0;->j:Landroid/view/View;

    .line 258
    .line 259
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :cond_c
    mul-int v6, p4, p3

    .line 264
    .line 265
    div-int/lit8 v6, v6, 0x64

    .line 266
    .line 267
    sub-int/2addr p4, v6

    .line 268
    neg-int p4, p4

    .line 269
    if-lez p4, :cond_d

    .line 270
    .line 271
    move p4, v5

    .line 272
    :cond_d
    sget-object v6, Ll/utg0;->d:Ljava/lang/String;

    .line 273
    .line 274
    if-eqz v6, :cond_f

    .line 275
    .line 276
    invoke-virtual {v6, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-nez v3, :cond_e

    .line 285
    .line 286
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    if-eqz v2, :cond_f

    .line 291
    .line 292
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string p3, ") "

    .line 301
    .line 302
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object p3

    .line 312
    goto :goto_6

    .line 313
    :cond_f
    new-instance v1, Ljava/lang/StringBuilder;

    .line 314
    .line 315
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    const-string p3, "%) "

    .line 322
    .line 323
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p3

    .line 333
    :goto_6
    const/16 v0, -0x2774

    .line 334
    .line 335
    if-ne v0, p1, :cond_15

    .line 336
    .line 337
    new-instance p1, Ljava/lang/StringBuilder;

    .line 338
    .line 339
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 340
    .line 341
    .line 342
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    if-eqz v0, :cond_11

    .line 347
    .line 348
    iget-object v0, v0, Ll/smg0;->c:LD/Sudif;

    .line 349
    .line 350
    if-nez v0, :cond_10

    .line 351
    .line 352
    goto :goto_7

    .line 353
    :cond_10
    sget-object v1, Ll/utg0;->d:Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {v0, v1}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    if-eqz v1, :cond_14

    .line 364
    .line 365
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 366
    .line 367
    sget v1, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_fail_upgrade:I

    .line 368
    .line 369
    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    goto :goto_9

    .line 378
    :cond_11
    :goto_7
    sget-object v0, Ll/utg0;->d:Ljava/lang/String;

    .line 379
    .line 380
    if-eqz v0, :cond_13

    .line 381
    .line 382
    const-string v1, "zh-CN"

    .line 383
    .line 384
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    if-nez v0, :cond_12

    .line 389
    .line 390
    goto :goto_8

    .line 391
    :cond_12
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 392
    .line 393
    sget v1, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_fail_upgrade:I

    .line 394
    .line 395
    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    goto :goto_9

    .line 404
    :cond_13
    :goto_8
    const-string v0, "Load fail, Please upgrade"

    .line 405
    .line 406
    :cond_14
    :goto_9
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    goto :goto_c

    .line 417
    :cond_15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 418
    .line 419
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 420
    .line 421
    .line 422
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    if-eqz v0, :cond_17

    .line 427
    .line 428
    iget-object v0, v0, Ll/smg0;->b:LD/Sudif;

    .line 429
    .line 430
    if-nez v0, :cond_16

    .line 431
    .line 432
    goto :goto_a

    .line 433
    :cond_16
    sget-object v1, Ll/utg0;->d:Ljava/lang/String;

    .line 434
    .line 435
    invoke-virtual {v0, v1}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    if-eqz v1, :cond_18

    .line 444
    .line 445
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 446
    .line 447
    sget v1, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_fail:I

    .line 448
    .line 449
    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v0

    .line 457
    goto :goto_b

    .line 458
    :cond_17
    :goto_a
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 459
    .line 460
    sget v1, Ltech/sud/gip/R$string;->fsm_mgp_loading_tip_fail:I

    .line 461
    .line 462
    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    :cond_18
    :goto_b
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object p1

    .line 480
    :goto_c
    iget-object p3, p0, Ll/bgg0;->l:Landroid/widget/TextView;

    .line 481
    .line 482
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 483
    .line 484
    .line 485
    if-eqz p2, :cond_19

    .line 486
    .line 487
    iget-object p1, p0, Ll/bgg0;->l:Landroid/widget/TextView;

    .line 488
    .line 489
    iget-object p2, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 490
    .line 491
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 492
    .line 493
    .line 494
    move-result-object p2

    .line 495
    sget p3, Ltech/sud/gip/R$color;->fsm_mgp_loading_tip_fail:I

    .line 496
    .line 497
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 498
    .line 499
    .line 500
    move-result p2

    .line 501
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 502
    .line 503
    .line 504
    :cond_19
    iget-object p1, p0, Ll/bgg0;->j:Landroid/view/View;

    .line 505
    .line 506
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    instance-of p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 511
    .line 512
    if-eqz p2, :cond_1a

    .line 513
    .line 514
    move-object p2, p1

    .line 515
    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 516
    .line 517
    invoke-virtual {p2, p4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 518
    .line 519
    .line 520
    iget-object p0, p0, Ll/bgg0;->j:Landroid/view/View;

    .line 521
    .line 522
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 523
    .line 524
    .line 525
    :cond_1a
    return-void
.end method

.method public final d(JJII)V
    .locals 4

    .line 1
    int-to-long v0, p5

    .line 2
    mul-long/2addr v0, p1

    .line 3
    div-long/2addr v0, p3

    .line 4
    long-to-int p5, v0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-gez p5, :cond_0

    .line 7
    .line 8
    move p5, v0

    .line 9
    :cond_0
    iget-object v1, p0, Ll/bgg0;->i:Landroid/widget/ProgressBar;

    .line 10
    .line 11
    iget v2, p0, Ll/bgg0;->c:I

    .line 12
    .line 13
    add-int/2addr v2, p5

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v1, v2, v3}, Landroid/widget/ProgressBar;->setProgress(IZ)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/wmg0;->a:Ll/aog0;

    .line 19
    .line 20
    iget v2, p0, Ll/bgg0;->c:I

    .line 21
    .line 22
    add-int/2addr v2, p5

    .line 23
    iget-object v1, v1, Ll/aog0;->a:Ll/dhg0;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    invoke-virtual {v1, v3, v0, v2, v0}, Ll/dhg0;->b(IIIZ)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/bgg0;->g()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/bgg0;->a()V

    .line 33
    .line 34
    .line 35
    iget v1, p0, Ll/bgg0;->c:I

    .line 36
    .line 37
    add-int/2addr v1, p5

    .line 38
    invoke-virtual {p0, v0, v0, v1, v0}, Ll/bgg0;->c(IZIZ)V

    .line 39
    .line 40
    .line 41
    cmp-long p1, p1, p3

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iput p6, p0, Ll/bgg0;->c:I

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wmg0;->a:Ll/aog0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, "ProxySudFSTAPPImpl"

    .line 7
    .line 8
    const-string v1, "onLoadingRetry"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/dhg0;->F:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Ll/aog0;->a:Ll/dhg0;

    .line 19
    .line 20
    iget-object v0, v0, Ll/dhg0;->w:Ll/iug0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/iug0;->h()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Ll/aog0;->a:Ll/dhg0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dhg0;->a()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p1, Ll/aog0;->a:Ll/dhg0;

    .line 31
    .line 32
    iget-object v0, p1, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/dhg0;->c(Ltech/sud/gip/core/GameInfo;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/bgg0;->g:Landroid/widget/TextView;

    .line 38
    .line 39
    const/4 p1, 0x4

    .line 40
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final f(Ljava/lang/String;)V
    .locals 12

    .line 1
    iget-boolean v0, p0, Ll/bgg0;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_10

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/bgg0;->s:Z

    .line 6
    .line 7
    if-nez v0, :cond_10

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_10

    .line 14
    .line 15
    iget-object v0, p0, Ll/bgg0;->e:Landroid/content/Context;

    .line 16
    .line 17
    sget-object v1, Ll/feg0;->j:Ll/feg0;

    .line 18
    .line 19
    if-nez v1, :cond_3

    .line 20
    .line 21
    const-class v1, Ll/feg0;

    .line 22
    .line 23
    monitor-enter v1

    .line 24
    :try_start_0
    sget-object v2, Ll/feg0;->j:Ll/feg0;

    .line 25
    .line 26
    if-nez v2, :cond_2

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    new-instance v6, Ll/nxg0;

    .line 41
    .line 42
    invoke-direct {v6, v3}, Ll/nxg0;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    new-instance v7, Ll/cng0;

    .line 46
    .line 47
    invoke-direct {v7, v3}, Ll/cng0;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Ll/ang0;

    .line 51
    .line 52
    invoke-direct {v4}, Ll/ang0;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v8, Ll/zyg0;

    .line 56
    .line 57
    invoke-direct {v8, v7}, Ll/zyg0;-><init>(Ll/cng0;)V

    .line 58
    .line 59
    .line 60
    new-instance v2, Ll/jeg0;

    .line 61
    .line 62
    sget-object v5, Ll/feg0;->i:Ll/txg0;

    .line 63
    .line 64
    invoke-direct/range {v2 .. v8}, Ll/jeg0;-><init>(Landroid/content/Context;Ll/ang0;Landroid/os/Handler;Ll/nxg0;Ll/cng0;Ll/zyg0;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ll/feg0;

    .line 68
    .line 69
    invoke-direct {v0, v3, v2, v7, v8}, Ll/feg0;-><init>(Landroid/content/Context;Ll/jeg0;Ll/cng0;Ll/zyg0;)V

    .line 70
    .line 71
    .line 72
    sput-object v0, Ll/feg0;->j:Ll/feg0;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception v0

    .line 76
    move-object p0, v0

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 79
    .line 80
    const-string p1, "Context must not be null."

    .line 81
    .line 82
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p0

    .line 86
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 87
    .line 88
    const-string p1, "context == null"

    .line 89
    .line 90
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0

    .line 94
    :cond_2
    :goto_0
    monitor-exit v1

    .line 95
    goto :goto_2

    .line 96
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    throw p0

    .line 98
    :cond_3
    :goto_2
    sget-object v0, Ll/feg0;->j:Ll/feg0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    const/4 v1, 0x0

    .line 104
    if-nez p1, :cond_4

    .line 105
    .line 106
    new-instance p1, Ll/eeg0;

    .line 107
    .line 108
    invoke-direct {p1, v0, v1}, Ll/eeg0;-><init>(Ll/feg0;Landroid/net/Uri;)V

    .line 109
    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-eqz v2, :cond_f

    .line 121
    .line 122
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    new-instance v2, Ll/eeg0;

    .line 127
    .line 128
    invoke-direct {v2, v0, p1}, Ll/eeg0;-><init>(Ll/feg0;Landroid/net/Uri;)V

    .line 129
    .line 130
    .line 131
    move-object p1, v2

    .line 132
    :goto_3
    const/4 v0, 0x2

    .line 133
    filled-new-array {v0}, [I

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iget v3, p1, Ll/eeg0;->c:I

    .line 138
    .line 139
    const/4 v4, 0x1

    .line 140
    or-int/2addr v3, v4

    .line 141
    iput v3, p1, Ll/eeg0;->c:I

    .line 142
    .line 143
    const/4 v5, 0x0

    .line 144
    aget v2, v2, v5

    .line 145
    .line 146
    if-eqz v2, :cond_e

    .line 147
    .line 148
    if-eq v2, v4, :cond_6

    .line 149
    .line 150
    if-ne v2, v0, :cond_5

    .line 151
    .line 152
    move v1, v0

    .line 153
    goto :goto_4

    .line 154
    :cond_5
    throw v1

    .line 155
    :cond_6
    move v1, v4

    .line 156
    :goto_4
    or-int/2addr v1, v3

    .line 157
    iput v1, p1, Ll/eeg0;->c:I

    .line 158
    .line 159
    iget-object v8, p0, Ll/bgg0;->h:Landroid/widget/ImageView;

    .line 160
    .line 161
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 162
    .line 163
    .line 164
    invoke-static {}, Ll/yuq0;->d()V

    .line 165
    .line 166
    .line 167
    if-eqz v8, :cond_d

    .line 168
    .line 169
    iget-object p0, p1, Ll/eeg0;->b:Ll/kxg0;

    .line 170
    .line 171
    iget-object p0, p0, Ll/kxg0;->a:Landroid/net/Uri;

    .line 172
    .line 173
    if-nez p0, :cond_7

    .line 174
    .line 175
    iget-object p0, p1, Ll/eeg0;->a:Ll/feg0;

    .line 176
    .line 177
    invoke-virtual {p0, v8}, Ll/feg0;->b(Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v8}, Ll/big0;->a(Landroid/widget/ImageView;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_7
    sget-object p0, Ll/eeg0;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 185
    .line 186
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 187
    .line 188
    .line 189
    iget-object p0, p1, Ll/eeg0;->b:Ll/kxg0;

    .line 190
    .line 191
    iget v1, p0, Ll/kxg0;->b:I

    .line 192
    .line 193
    if-nez v1, :cond_8

    .line 194
    .line 195
    iput v0, p0, Ll/kxg0;->b:I

    .line 196
    .line 197
    :cond_8
    new-instance v9, Ll/lxg0;

    .line 198
    .line 199
    iget-object v0, p0, Ll/kxg0;->a:Landroid/net/Uri;

    .line 200
    .line 201
    iget p0, p0, Ll/kxg0;->b:I

    .line 202
    .line 203
    invoke-direct {v9, v0, p0}, Ll/lxg0;-><init>(Landroid/net/Uri;I)V

    .line 204
    .line 205
    .line 206
    sget-object p0, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    .line 207
    .line 208
    const/16 v1, 0x32

    .line 209
    .line 210
    if-eqz v0, :cond_9

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    add-int/2addr v2, v1

    .line 221
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_9
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    :goto_5
    const/16 v0, 0xa

    .line 235
    .line 236
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v11

    .line 243
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 244
    .line 245
    .line 246
    iget p0, p1, Ll/eeg0;->c:I

    .line 247
    .line 248
    and-int/2addr p0, v4

    .line 249
    if-nez p0, :cond_b

    .line 250
    .line 251
    iget-object p0, p1, Ll/eeg0;->a:Ll/feg0;

    .line 252
    .line 253
    iget-object v0, p0, Ll/feg0;->d:Ll/cng0;

    .line 254
    .line 255
    invoke-virtual {v0, v11}, Ll/cng0;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iget-object p0, p0, Ll/feg0;->e:Ll/zyg0;

    .line 260
    .line 261
    if-eqz v0, :cond_a

    .line 262
    .line 263
    iget-object p0, p0, Ll/zyg0;->b:Ll/mxg0;

    .line 264
    .line 265
    invoke-virtual {p0, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 266
    .line 267
    .line 268
    goto :goto_6

    .line 269
    :cond_a
    iget-object p0, p0, Ll/zyg0;->b:Ll/mxg0;

    .line 270
    .line 271
    invoke-virtual {p0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 272
    .line 273
    .line 274
    :goto_6
    if-eqz v0, :cond_b

    .line 275
    .line 276
    iget-object p0, p1, Ll/eeg0;->a:Ll/feg0;

    .line 277
    .line 278
    invoke-virtual {p0, v8}, Ll/feg0;->b(Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    iget-object p0, p1, Ll/eeg0;->a:Ll/feg0;

    .line 282
    .line 283
    iget-object p0, p0, Ll/feg0;->b:Landroid/content/Context;

    .line 284
    .line 285
    invoke-static {v8, p0, v0, v4}, Ll/big0;->b(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;I)V

    .line 286
    .line 287
    .line 288
    return-void

    .line 289
    :cond_b
    invoke-static {v8}, Ll/big0;->a(Landroid/widget/ImageView;)V

    .line 290
    .line 291
    .line 292
    new-instance v6, Ll/vhg0;

    .line 293
    .line 294
    iget-object v7, p1, Ll/eeg0;->a:Ll/feg0;

    .line 295
    .line 296
    iget v10, p1, Ll/eeg0;->c:I

    .line 297
    .line 298
    invoke-direct/range {v6 .. v11}, Ll/vhg0;-><init>(Ll/feg0;Landroid/widget/ImageView;Ll/lxg0;ILjava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object p0, p1, Ll/eeg0;->a:Ll/feg0;

    .line 302
    .line 303
    invoke-virtual {v6}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    if-eqz p1, :cond_c

    .line 308
    .line 309
    iget-object v0, p0, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 310
    .line 311
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    if-eq v0, v6, :cond_c

    .line 316
    .line 317
    invoke-virtual {p0, p1}, Ll/feg0;->b(Ljava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 321
    .line 322
    invoke-virtual {v0, p1, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    :cond_c
    iget-object p0, p0, Ll/feg0;->c:Ll/jeg0;

    .line 326
    .line 327
    iget-object p0, p0, Ll/jeg0;->h:Ll/nvg0;

    .line 328
    .line 329
    invoke-virtual {p0, v4, v6}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 334
    .line 335
    .line 336
    return-void

    .line 337
    :cond_d
    const-string p0, "Target must not be null."

    .line 338
    .line 339
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :cond_e
    const-string p0, "Memory policy cannot be null."

    .line 344
    .line 345
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :cond_f
    const-string p0, "Path must not be empty."

    .line 350
    .line 351
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    :cond_10
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bgg0;->u:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/bgg0;->u:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bgg0;->g()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/16 v1, 0x50

    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/bgg0;->u:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    const-wide/16 v1, 0x3e8

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/bgg0;->u:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/bgg0;->u:Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    new-instance v1, Ll/efg0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/efg0;-><init>(Ll/bgg0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/bgg0;->u:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
