.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ll/pf60;
    .locals 1

    .line 1
    sget v0, Ll/kbc0;->w:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 3

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
    sget v1, Ll/kec0;->F2:I

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
    sget v1, Ll/adc0;->ge:I

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 25
    .line 26
    sget v1, Ll/adc0;->ie:I

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 35
    .line 36
    sget v1, Ll/adc0;->he:I

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 45
    .line 46
    sget v1, Ll/bnl0;->e:I

    .line 47
    .line 48
    sget v2, Ll/bnl0;->f:I

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public c(IZZ)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ltz p1, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->getCardBgList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge p1, v2, :cond_2

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->getCardBgList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    check-cast p3, Ll/pf60;

    .line 26
    .line 27
    iget-object p3, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p3, Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 37
    .line 38
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/xra;->q()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_1

    .line 52
    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 54
    .line 55
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->b:Lv/VText;

    .line 60
    .line 61
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->a:Lv/VImage;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->getCardBgList()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Ll/pf60;

    .line 75
    .line 76
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v2, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-virtual {p3, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 88
    .line 89
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 93
    .line 94
    const-string v2, ""

    .line 95
    .line 96
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/xra;->q()Z

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    if-eqz p3, :cond_3

    .line 104
    .line 105
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    iget-object p3, p3, Ll/dkb;->Z3:Ll/wyd0;

    .line 110
    .line 111
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    check-cast p3, Ljava/lang/String;

    .line 116
    .line 117
    const-string v2, "marryMode"

    .line 118
    .line 119
    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    if-eqz p3, :cond_3

    .line 124
    .line 125
    move p2, v1

    .line 126
    :cond_3
    if-eqz p2, :cond_5

    .line 127
    .line 128
    invoke-static {}, Ll/xra;->w()Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_4

    .line 133
    .line 134
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 139
    .line 140
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    if-ge p1, p3, :cond_4

    .line 147
    .line 148
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 149
    .line 150
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    check-cast p3, Ljava/lang/Integer;

    .line 157
    .line 158
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    if-lez p3, :cond_4

    .line 163
    .line 164
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 165
    .line 166
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    new-instance p3, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v0, "+"

    .line 172
    .line 173
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 177
    .line 178
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 179
    .line 180
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p1, "%"

    .line 188
    .line 189
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    .line 200
    .line 201
    :cond_4
    return-void

    .line 202
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpFakeCardBgView;->c:Lv/VText;

    .line 203
    .line 204
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public getCardBgList()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v7, "\u6211\u7684\u53a8\u827a"

    .line 2
    .line 3
    const-string v8, "\u4efb\u610f\u751f\u6d3b\u7167"

    .line 4
    .line 5
    const-string v0, "\u771f\u5b9e\u7684\u6b63\u9762\u7167"

    .line 6
    .line 7
    const-string v1, "\u6237\u5916\u7167"

    .line 8
    .line 9
    const-string v2, "\u5168\u8eab\u7167"

    .line 10
    .line 11
    const-string v3, "\u5174\u8da3\u7231\u597d"

    .line 12
    .line 13
    const-string v4, "\u6211\u7684\u624d\u827a"

    .line 14
    .line 15
    const-string v5, "\u6211\u7684\u5ba0\u7269"

    .line 16
    .line 17
    const-string v6, "\u6e38\u620f\u6218\u7ee9"

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ll/cff;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/cff;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
