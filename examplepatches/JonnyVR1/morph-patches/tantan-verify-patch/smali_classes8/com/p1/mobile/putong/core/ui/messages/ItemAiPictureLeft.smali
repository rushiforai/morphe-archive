.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ProgressBar;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/core/data/Message;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->i:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->n(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->o(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->r(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->q(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->p(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->l(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->h:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->h:Lcom/p1/mobile/putong/core/data/Message;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->h:Lcom/p1/mobile/putong/core/data/Message;

    .line 40
    .line 41
    invoke-interface {v0, v1, v2, p0}, Ll/r97;->M5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    :goto_0
    new-instance p0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 8

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto/16 :goto_2

    .line 4
    .line 5
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->e:Lv/VText;

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p3, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 14
    .line 15
    .line 16
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 17
    .line 18
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p3, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 23
    .line 24
    .line 25
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p3, v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 32
    .line 33
    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->h:Lcom/p1/mobile/putong/core/data/Message;

    .line 35
    .line 36
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    if-eqz p3, :cond_1

    .line 43
    .line 44
    goto/16 :goto_2

    .line 45
    .line 46
    :cond_1
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    check-cast p3, Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 55
    .line 56
    const-string v1, "raw"

    .line 57
    .line 58
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->c:Lv/VDraweeView;

    .line 67
    .line 68
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->c:Lv/VDraweeView;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->h:Lcom/p1/mobile/putong/core/data/Message;

    .line 86
    .line 87
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    const-string v1, "0"

    .line 94
    .line 95
    const-string v3, "\u559c\u6b22"

    .line 96
    .line 97
    const-string v4, "#CC000000"

    .line 98
    .line 99
    const/4 v5, 0x1

    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_5

    .line 111
    .line 112
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiPicture;->likeStatus:Ljava/lang/String;

    .line 117
    .line 118
    const-string v6, "like"

    .line 119
    .line 120
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    const-string v7, "#33000000"

    .line 125
    .line 126
    if-eqz v6, :cond_3

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 129
    .line 130
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 138
    .line 139
    const-string v1, "\u5df2\u559c\u6b22"

    .line 140
    .line 141
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 145
    .line 146
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 150
    .line 151
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    const-string v1, "yes"

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_3
    const-string v6, "dislike"

    .line 158
    .line 159
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_4

    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 166
    .line 167
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 175
    .line 176
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 180
    .line 181
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    const-string v1, "no"

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 188
    .line 189
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 197
    .line 198
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 206
    .line 207
    invoke-static {v0, v3}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 211
    .line 212
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 216
    .line 217
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 222
    .line 223
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 231
    .line 232
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 240
    .line 241
    invoke-static {v0, v3}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 245
    .line 246
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 250
    .line 251
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->c:Lv/VDraweeView;

    .line 255
    .line 256
    new-instance v2, Ll/p2q;

    .line 257
    .line 258
    invoke-direct {v2, p0, p2, p3}, Ll/p2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V

    .line 259
    .line 260
    .line 261
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 262
    .line 263
    .line 264
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 265
    .line 266
    new-instance v0, Ll/q2q;

    .line 267
    .line 268
    invoke-direct {v0, p0, p2, p1}, Ll/q2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Ll/pol;)V

    .line 269
    .line 270
    .line 271
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 272
    .line 273
    .line 274
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 275
    .line 276
    new-instance v0, Ll/r2q;

    .line 277
    .line 278
    invoke-direct {v0, p0, p2, p1}, Ll/r2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Lcom/p1/mobile/putong/core/data/Message;Ll/pol;)V

    .line 279
    .line 280
    .line 281
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 282
    .line 283
    .line 284
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->c:Lv/VDraweeView;

    .line 285
    .line 286
    new-instance p3, Ll/s2q;

    .line 287
    .line 288
    invoke-direct {p3, p0}, Ll/s2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 292
    .line 293
    .line 294
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->i:Z

    .line 295
    .line 296
    if-nez p1, :cond_6

    .line 297
    .line 298
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->i:Z

    .line 299
    .line 300
    const-string p0, "other_uid"

    .line 301
    .line 302
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 303
    .line 304
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    const-string p1, "paip_ai_picture_feedback"

    .line 309
    .line 310
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    const-string p1, "e_paip_ai_picture_feedback"

    .line 319
    .line 320
    const-string p2, "p_chat_view"

    .line 321
    .line 322
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 323
    .line 324
    .line 325
    :cond_6
    :goto_2
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x2q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->h:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 33
    .line 34
    const-string v1, "dismissed"

    .line 35
    .line 36
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_3
    :goto_0
    const-string p0, "\u5df2\u89e3\u9664\u914d\u5bf9\uff0c\u65e0\u6cd5\u67e5\u770b"

    .line 46
    .line 47
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return v0
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->d:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->d:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-interface {p3, p0, p1, p2}, Ll/r97;->J4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic n(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 2
    .line 3
    const-string v0, "#33000000"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const-string v0, "like"

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 12
    .line 13
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 14
    .line 15
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/AiPicture;->likeStatus:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-eqz p3, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->j()Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eqz p3, :cond_1

    .line 39
    .line 40
    :goto_0
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 50
    .line 51
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->to(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p2, p3, p1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Ll/v2q;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Ll/v2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/w2q;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/w2q;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    const-string p0, "e_paip_ai_picture_feedback"

    .line 77
    .line 78
    const-string p1, "p_chat_view"

    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 2
    .line 3
    const-string v0, "#33000000"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->g:Lv/VText;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->f:Lv/VText;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const-string v0, "dislike"

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 12
    .line 13
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 14
    .line 15
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 22
    .line 23
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/AiPicture;->likeStatus:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-eqz p3, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->j()Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eqz p3, :cond_1

    .line 39
    .line 40
    :goto_0
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 50
    .line 51
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->to(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p2, p3, p1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Ll/t2q;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Ll/t2q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/u2q;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/u2q;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    const-string p0, "e_paip_ai_picture_feedback"

    .line 77
    .line 78
    const-string p1, "p_chat_view"

    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->c:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->d:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;->d:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
