.class public Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/oyl;


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public j:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 133
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 132
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->l:Z

    .line 6
    .line 7
    sget-object p3, Ll/rhc0;->q:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget p3, Ll/rhc0;->s:I

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    sget v0, Ll/rhc0;->r:I

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->j:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget p2, Ll/sec0;->V:I

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    sget p1, Ll/gdc0;->Y:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lv/VText;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->d:Lv/VText;

    .line 49
    .line 50
    sget p1, Ll/gdc0;->C:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lv/VText;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 59
    .line 60
    sget p1, Ll/gdc0;->K:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lv/VImage;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->f:Lv/VImage;

    .line 69
    .line 70
    sget p1, Ll/gdc0;->n:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lv/VImage;

    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->g:Lv/VImage;

    .line 79
    .line 80
    sget p1, Ll/gdc0;->L:I

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lv/VImage;

    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->h:Lv/VImage;

    .line 89
    .line 90
    sget p1, Ll/gdc0;->U:I

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->d:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 106
    .line 107
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->j:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->d:Lv/VText;

    .line 113
    .line 114
    const/4 p2, 0x3

    .line 115
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    invoke-virtual {p1, p3, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 123
    .line 124
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 129
    .line 130
    .line 131
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->j0()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_STATUS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 13
    .line 14
    invoke-static {v1, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_AGE_EDIT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 22
    .line 23
    invoke-static {v1, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_QUALIFICATIONS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 31
    .line 32
    invoke-static {v1, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_HEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 40
    .line 41
    invoke-static {v1, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_INCOME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 49
    .line 50
    invoke-static {v1, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_ADDRESS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 58
    .line 59
    invoke-static {v1, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    new-instance v1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Ljava/lang/String;

    .line 86
    .line 87
    const-string v3, "\u4e0d\u9650"

    .line 88
    .line 89
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_1

    .line 94
    .line 95
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-nez v3, :cond_1

    .line 100
    .line 101
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i0(Ljava/lang/String;)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 116
    .line 117
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    const/4 v2, 0x0

    .line 122
    if-eqz v0, :cond_3

    .line 123
    .line 124
    const-string p1, ""

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 128
    .line 129
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 134
    .line 135
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Ljava/lang/String;

    .line 140
    .line 141
    :goto_1
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_4

    .line 146
    .line 147
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_4

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->j0()V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 158
    .line 159
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->g:Lv/VImage;

    .line 168
    .line 169
    const/4 v3, 0x1

    .line 170
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->f:Lv/VImage;

    .line 174
    .line 175
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->l:Z

    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->h:Lv/VImage;

    .line 181
    .line 182
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 186
    .line 187
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_5

    .line 195
    .line 196
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 197
    .line 198
    const/high16 v0, 0x41b80000    # 23.0f

    .line 199
    .line 200
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 208
    .line 209
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 213
    .line 214
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    const/high16 v0, 0x41a80000    # 21.0f

    .line 223
    .line 224
    if-eqz p1, :cond_6

    .line 225
    .line 226
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 227
    .line 228
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 236
    .line 237
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 241
    .line 242
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 247
    .line 248
    const/high16 v1, 0x41400000    # 12.0f

    .line 249
    .line 250
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 258
    .line 259
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 267
    .line 268
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 269
    .line 270
    .line 271
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 272
    .line 273
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    return-void
.end method

.method public d0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public getClickView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i0(Ljava/lang/String;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/sec0;->U:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget v0, Ll/gdc0;->g:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VText;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x3

    .line 28
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public final j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 2
    .line 3
    const/high16 v1, 0x41b80000    # 23.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->g:Lv/VImage;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->f:Lv/VImage;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->h:Lv/VImage;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->i:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->e:Lv/VText;

    .line 48
    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    xor-int/2addr v0, v2

    .line 59
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;->l:Z

    .line 60
    .line 61
    return-void
.end method

.method public bridge synthetic setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/oyl;->setContent(Ljava/lang/String;)V

    return-void
.end method
