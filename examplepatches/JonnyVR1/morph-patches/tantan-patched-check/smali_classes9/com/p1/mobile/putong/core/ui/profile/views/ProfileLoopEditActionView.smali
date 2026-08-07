.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VEditText;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VLinear;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VText;

.field public l:Lv/VLinear;

.field public m:Lv/VDraweeView;

.field public n:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public o:Lv/VText;

.field public p:Landroid/widget/TextView;

.field public q:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

.field public r:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;

.field public s:Ljava/lang/String;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;)Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->r:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;

    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hna0;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->showTitle:Z

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 11
    .line 12
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->showTitle:Z

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editTitle:Z

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->subTitle:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->d:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->d:Landroid/widget/TextView;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->subTitle:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editTitle:Z

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->subTitle:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 71
    .line 72
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->subTitle:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 83
    .line 84
    const/high16 v1, 0x41f00000    # 30.0f

    .line 85
    .line 86
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 91
    .line 92
    .line 93
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 94
    .line 95
    invoke-static {v0}, Ll/cqa0;->a(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->f:Landroid/widget/TextView;

    .line 99
    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    iget v2, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->maxInput:I

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v2, ""

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 123
    .line 124
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->title:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 130
    .line 131
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;

    .line 132
    .line 133
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->defaultContent:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_3

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 148
    .line 149
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->defaultContent:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 155
    .line 156
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->defaultContent:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 163
    .line 164
    .line 165
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 166
    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v2, " "

    .line 170
    .line 171
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editHint:Ljava/lang/String;

    .line 175
    .line 176
    const-string v3, "\n"

    .line 177
    .line 178
    const-string v4, "\n "

    .line 179
    .line 180
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 195
    .line 196
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->maxInput:I

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Lv/VEditText;->setMaxLength(I)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public d(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    const-string p0, "\n"

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/xra;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 9
    .line 10
    if-ne p2, v0, :cond_1

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->h:Lv/VLinear;

    .line 13
    .line 14
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->k:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->l:Lv/VLinear;

    .line 24
    .line 25
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 p2, 0x3

    .line 33
    const-string v0, "#99000000"

    .line 34
    .line 35
    const-string v2, "1630\u4e2a\u559c\u6b22"

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->m:Lv/VDraweeView;

    .line 42
    .line 43
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpOSzJBVlhNSE9ETExRVkZINUdRWUg2QkRPQTZZNzE0IiwidyI6MTAyLCJoIjoxMDIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTM2MTUyNzQ0NzAzMzAwOTM5fQ.png"

    .line 44
    .line 45
    sget v5, Ll/qa00;->w:I

    .line 46
    .line 47
    invoke-virtual {p1, v3, v4, v5, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->p:Landroid/widget/TextView;

    .line 51
    .line 52
    const-string v3, "\u91cd\u5e86\u59b9\u5b50\uff0c\u6027\u683c\u5f00\u6717\uff0c\u94f2\u5c4e\u5b98\u4e00\u679a\u3002\u5e73\u65f6\u559c\u6b22\u6253\u7fbd\u6bdb\u7403\u3001\u684c\u6e38\uff0c\u5076\u5c14\u6668\u8dd1\u6216\u6e38\u6cf3\u3002\u5e0c\u671b\u8ba4\u8bc6\u4e00\u4e2a\u7231\u597d\u3001\u7cbe\u795e\u5951\u5408\uff0c\u53ef\u4ee5\u8ba4\u771f\u604b\u7231\u7684\u7537\u5b69\u3002"

    .line 53
    .line 54
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->k:Lv/VText;

    .line 58
    .line 59
    const-string v3, "\u5979\u4eec\u8fd9\u6837\u5199\uff0c\u66f4\u53d7\u6b22\u8fce"

    .line 60
    .line 61
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->n:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 65
    .line 66
    const-string v3, "\u9648\u59d7\u59d7 25"

    .line 67
    .line 68
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->o:Lv/VText;

    .line 72
    .line 73
    filled-new-array {v2}, [Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-static {p2, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    const-string v1, "\u5979\u5728\u63a2\u63a2\u6536\u5230\u4e86 1630\u4e2a\u559c\u6b22"

    .line 94
    .line 95
    invoke-static {v1, p1, v0, p2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 104
    .line 105
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->m:Lv/VDraweeView;

    .line 106
    .line 107
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhXNVFYWFJBNlE3VERFWDQ3Q1c3RkZVTTVWNElINjE0IiwidyI6MTAyLCJoIjoxMDIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTYwNjcyMjU4Mzg5NjQ2NjExfQ.png"

    .line 108
    .line 109
    sget v5, Ll/qa00;->w:I

    .line 110
    .line 111
    invoke-virtual {p1, v3, v4, v5, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->p:Landroid/widget/TextView;

    .line 115
    .line 116
    const-string v3, "\u60c5\u7eea\u7a33\u5b9a\uff0c\u6709\u4e8b\u4e1a\u5fc3\u3002\u5e73\u65f6\u559c\u6b22\u6253\u7bee\u7403\u3001\u7fbd\u6bdb\u7403\uff0c\u6709\u65f6\u95f4\u4f1a\u53bb\u65c5\u6e38\u6253\u5361\u3002\u5e0c\u671b\u8ba4\u8bc6\u4e00\u4e2a\u4e50\u89c2\u5584\u826f\u3001\u6709\u5171\u540c\u8bdd\u9898\u7684\u5973\u5b69\u3002"

    .line 117
    .line 118
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->k:Lv/VText;

    .line 122
    .line 123
    const-string v3, "\u4ed6\u4eec\u8fd9\u6837\u5199\uff0c\u66f4\u53d7\u6b22\u8fce"

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->n:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 129
    .line 130
    const-string v3, "\u674e\u6cfd\u6977 26"

    .line 131
    .line 132
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->o:Lv/VText;

    .line 136
    .line 137
    filled-new-array {v2}, [Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-static {p2, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    const-string v1, "\u4ed6\u5728\u63a2\u63a2\u6536\u5230\u4e86 1630\u4e2a\u559c\u6b22"

    .line 158
    .line 159
    invoke-static {v1, p1, v0, p2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->h:Lv/VLinear;

    .line 168
    .line 169
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->k:Lv/VText;

    .line 173
    .line 174
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->l:Lv/VLinear;

    .line 178
    .line 179
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public f(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-static {p0, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->q:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->maxInput:I

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    sub-int/2addr p0, p1

    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p0, ""

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public getInputValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInputTextChangeListener(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->r:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;

    .line 2
    .line 3
    return-void
.end method
