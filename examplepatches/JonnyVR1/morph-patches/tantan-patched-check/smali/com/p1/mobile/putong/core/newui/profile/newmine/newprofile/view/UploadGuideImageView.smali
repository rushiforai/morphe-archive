.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Lv/AutoVDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/ViewGroup;

.field public g:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->a:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->a:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->c(Landroid/view/View;)V

    return-void
.end method

.method private setImage(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->b:Lv/AutoVDraweeView;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final b(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v2, Ll/qa00;->s:I

    .line 13
    .line 14
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 19
    .line 20
    sget v3, Ll/qa00;->r:I

    .line 21
    .line 22
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 23
    .line 24
    const/4 v3, 0x4

    .line 25
    if-ne p1, v3, :cond_0

    .line 26
    .line 27
    sget p1, Ll/dbc0;->Uq:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v3, 0x5

    .line 34
    if-ne p1, v3, :cond_1

    .line 35
    .line 36
    sget p1, Ll/dbc0;->Oq:I

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    sget v1, Ll/bnl0;->e:I

    .line 58
    .line 59
    sget v3, Ll/qa00;->x:I

    .line 60
    .line 61
    invoke-direct {v0, v1, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    const/high16 v1, 0x41d80000    # 27.0f

    .line 65
    .line 66
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 71
    .line 72
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 77
    .line 78
    sget v1, Ll/qa00;->F:I

    .line 79
    .line 80
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 81
    .line 82
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 83
    .line 84
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 85
    .line 86
    .line 87
    const/high16 v1, 0x41500000    # 13.0f

    .line 88
    .line 89
    invoke-virtual {p1, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    sget v3, Ll/c9c0;->w0:I

    .line 101
    .line 102
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 113
    .line 114
    invoke-virtual {p2, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Landroid/widget/TextView;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-direct {p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 124
    .line 125
    .line 126
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 127
    .line 128
    sget v0, Ll/qa00;->K:I

    .line 129
    .line 130
    sget v1, Ll/qa00;->w:I

    .line 131
    .line 132
    invoke-direct {p2, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 133
    .line 134
    .line 135
    const/high16 v0, 0x42d00000    # 104.0f

    .line 136
    .line 137
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 142
    .line 143
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 144
    .line 145
    sget v0, Ll/dbc0;->Z0:I

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 148
    .line 149
    .line 150
    const/16 v0, 0x11

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 153
    .line 154
    .line 155
    const/high16 v0, 0x41600000    # 14.0f

    .line 156
    .line 157
    invoke-virtual {p1, v2, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    sget v1, Ll/c9c0;->Q0:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 175
    .line 176
    .line 177
    const-string v0, "\u91cd\u65b0\u4e0a\u4f20"

    .line 178
    .line 179
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    new-instance v0, Ll/c3k0;

    .line 183
    .line 184
    invoke-direct {v0, p0}, Ll/c3k0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;)V

    .line 185
    .line 186
    .line 187
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 196
    .line 197
    sget p2, Ll/dbc0;->Y0:I

    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 203
    .line 204
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public final synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->g:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setImage(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final e(ILjava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget v4, Ll/qa00;->h:I

    .line 19
    .line 20
    invoke-static {v0, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->a:I

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 28
    .line 29
    sget v4, Ll/qa00;->g:I

    .line 30
    .line 31
    invoke-static {v0, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    if-ne v0, v3, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 38
    .line 39
    sget v4, Ll/qa00;->i:I

    .line 40
    .line 41
    invoke-static {v0, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d:Landroid/widget/TextView;

    .line 50
    .line 51
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    if-ne p1, v1, :cond_3

    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->c:Landroid/widget/ImageView;

    .line 57
    .line 58
    invoke-static {}, Ll/gra;->z()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    sget p2, Ll/dbc0;->Sq:I

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    sget p2, Ll/dbc0;->Rq:I

    .line 68
    .line 69
    :goto_1
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 73
    .line 74
    sget p1, Ll/dbc0;->a1:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    if-ne p1, v3, :cond_4

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->c:Landroid/widget/ImageView;

    .line 83
    .line 84
    sget p2, Ll/dbc0;->Tq:I

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 90
    .line 91
    sget p1, Ll/dbc0;->b1:I

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_4
    const/4 v0, 0x3

    .line 98
    if-ne p1, v0, :cond_6

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->c:Landroid/widget/ImageView;

    .line 101
    .line 102
    invoke-static {}, Ll/gra;->z()Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_5

    .line 107
    .line 108
    sget p2, Ll/dbc0;->Qq:I

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_5
    sget p2, Ll/dbc0;->Pq:I

    .line 112
    .line 113
    :goto_2
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 117
    .line 118
    sget p1, Ll/dbc0;->c1:I

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 125
    .line 126
    const/4 v1, 0x4

    .line 127
    if-ne p1, v1, :cond_7

    .line 128
    .line 129
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->b(ILjava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_7
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->z9:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/AutoVDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->b:Lv/AutoVDraweeView;

    .line 13
    .line 14
    sget v0, Ll/adc0;->w5:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/ImageView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->c:Landroid/widget/ImageView;

    .line 23
    .line 24
    sget v0, Ll/adc0;->Sd:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/adc0;->Id:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->e:Landroid/view/View;

    .line 41
    .line 42
    sget v0, Ll/adc0;->tb:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/view/ViewGroup;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->f:Landroid/view/ViewGroup;

    .line 51
    .line 52
    return-void
.end method

.method public setRefusedClickCallback(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->g:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setSizeType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->a:I

    .line 2
    .line 3
    return-void
.end method
