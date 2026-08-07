.class public Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Ll/jyf;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/sec0;->t0:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/gdc0;->V:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VImage;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 25
    .line 26
    sget v1, Ll/gdc0;->X:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lv/VText;

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 35
    .line 36
    sget v1, Ll/gdc0;->W:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VText;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 45
    .line 46
    new-instance v1, Ll/jyf;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/jyf;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->e:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Ll/jyf;->b(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)Ll/jyf;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->d:Ll/jyf;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/xra;->w()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    invoke-static {}, Ll/xra;->l()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    return-void

    .line 80
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 81
    .line 82
    sget v1, Ll/qa00;->h:I

    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 85
    .line 86
    .line 87
    sget v0, Ll/qa00;->q:I

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 90
    .line 91
    const/4 v2, 0x1

    .line 92
    new-array v2, v2, [Landroid/view/View;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    aput-object v1, v2, v3

    .line 96
    .line 97
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 101
    .line 102
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 106
    .line 107
    const/4 v0, 0x3

    .line 108
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p0, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public b(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->d:Ll/jyf;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jyf;->e:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-ltz p1, :cond_2

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge p1, v2, :cond_2

    .line 13
    .line 14
    invoke-static {}, Ll/xra;->n()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 21
    .line 22
    const/4 v3, 0x3

    .line 23
    if-ge p1, v3, :cond_0

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ll/pf60;

    .line 30
    .line 31
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v3, Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 39
    .line 40
    const/4 v3, 0x1

    .line 41
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 50
    .line 51
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ll/pf60;

    .line 56
    .line 57
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v3, Ljava/lang/CharSequence;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 65
    .line 66
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Ll/pf60;

    .line 71
    .line 72
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p1, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {v2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 81
    .line 82
    .line 83
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 84
    .line 85
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public c(IZ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->d:Ll/jyf;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jyf;->e:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ltz p1, :cond_5

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-ge p1, v3, :cond_5

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Ll/pf60;

    .line 20
    .line 21
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v3, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {}, Ll/xra;->k()Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-nez v4, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/xra;->m()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 44
    .line 45
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    :goto_0
    if-nez p2, :cond_3

    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    if-ge p1, v4, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 56
    .line 57
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 67
    .line 68
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :goto_2
    invoke-static {}, Ll/xra;->q()Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_4

    .line 76
    .line 77
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_4

    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->b:Lv/VText;

    .line 84
    .line 85
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    :cond_4
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->a:Lv/VImage;

    .line 89
    .line 90
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Ll/pf60;

    .line 95
    .line 96
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v0, Ljava/lang/Integer;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 105
    .line 106
    .line 107
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 108
    .line 109
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 113
    .line 114
    const-string v3, ""

    .line 115
    .line 116
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Ll/xra;->q()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 128
    .line 129
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Ljava/lang/String;

    .line 136
    .line 137
    const-string v3, "marryMode"

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    move p2, v2

    .line 146
    :cond_6
    if-eqz p2, :cond_9

    .line 147
    .line 148
    invoke-static {}, Ll/xra;->w()Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    const-string v0, "%"

    .line 153
    .line 154
    const-string v2, "+"

    .line 155
    .line 156
    if-eqz p2, :cond_7

    .line 157
    .line 158
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 163
    .line 164
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 165
    .line 166
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    if-ge p1, v3, :cond_8

    .line 171
    .line 172
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 173
    .line 174
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

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
    if-lez v3, :cond_8

    .line 187
    .line 188
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 189
    .line 190
    invoke-static {v3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    new-instance v1, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 199
    .line 200
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 201
    .line 202
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 217
    .line 218
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_7
    invoke-static {}, Ll/xra;->h()Z

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    if-eqz p2, :cond_8

    .line 227
    .line 228
    invoke-static {}, Ll/xra;->c()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 233
    .line 234
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 235
    .line 236
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-ge p1, v3, :cond_8

    .line 241
    .line 242
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 243
    .line 244
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 245
    .line 246
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    check-cast v3, Ljava/lang/Integer;

    .line 251
    .line 252
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    if-lez v3, :cond_8

    .line 257
    .line 258
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 259
    .line 260
    invoke-static {v3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 261
    .line 262
    .line 263
    new-instance v1, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 269
    .line 270
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 271
    .line 272
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 287
    .line 288
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    .line 290
    .line 291
    :cond_8
    return-void

    .line 292
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeCardBgView;->c:Lv/VText;

    .line 293
    .line 294
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 295
    .line 296
    .line 297
    return-void
.end method
