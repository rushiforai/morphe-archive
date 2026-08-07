.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->j(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->k(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    .line 4
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 11
    .line 12
    :try_start_1
    iget-object v2, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->button:Lcom/p1/mobile/putong/data/MessageCallToBuyButton;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/data/MessageCallToBuyButton;->redirect:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 20
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->button:Lcom/p1/mobile/putong/data/MessageCallToBuyButton;

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    :try_start_2
    iget-object v2, v3, Lcom/p1/mobile/putong/data/MessageCallToBuyButton;->redirect:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v2

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    iget-object v2, v3, Lcom/p1/mobile/putong/data/MessageCallToBuyButton;->href:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 34
    .line 35
    :goto_0
    iget-object v0, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->cardVersion:Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :catch_1
    move-exception v2

    .line 39
    move-object v1, v0

    .line 40
    :goto_1
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :goto_2
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2}, Ll/k900;->c(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1}, Ll/k900;->i(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v2, "assistant_types"

    .line 63
    .line 64
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string v2, "card_ui"

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    filled-new-array {p1, v2}, [Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string v2, "e_ctbscard"

    .line 83
    .line 84
    const-string v3, "p_chat_view"

    .line 85
    .line 86
    invoke-static {v2, v3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    const/4 v2, 0x1

    .line 94
    if-eqz p1, :cond_4

    .line 95
    .line 96
    const-string p1, "5"

    .line 97
    .line 98
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->cardVersion:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    const/4 v3, 0x0

    .line 105
    if-eqz p1, :cond_2

    .line 106
    .line 107
    iget-object p1, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->medias:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_2

    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->b:Landroid/widget/FrameLayout;

    .line 116
    .line 117
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->c:Lv/VDraweeView;

    .line 121
    .line 122
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 127
    .line 128
    const/high16 v4, 0x43520000    # 210.0f

    .line 129
    .line 130
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 135
    .line 136
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->c:Lv/VDraweeView;

    .line 137
    .line 138
    invoke-virtual {v4, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->medias:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lcom/p1/mobile/putong/data/MessageCallToBuyMedia;

    .line 148
    .line 149
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 150
    .line 151
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->c:Lv/VDraweeView;

    .line 152
    .line 153
    iget-object v5, p1, Lcom/p1/mobile/putong/data/MessageCallToBuyMedia;->url:Ljava/lang/String;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageCallToBuyMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 156
    .line 157
    iget v6, p1, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->iterations:I

    .line 158
    .line 159
    iget p1, p1, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->blurRadius:I

    .line 160
    .line 161
    invoke-virtual {v3, v4, v5, v6, p1}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 162
    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->b:Landroid/widget/FrameLayout;

    .line 166
    .line 167
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d:Lv/VText;

    .line 171
    .line 172
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d:Lv/VText;

    .line 180
    .line 181
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->text:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->e:Lv/VText;

    .line 187
    .line 188
    const/4 v3, 0x3

    .line 189
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {p1, v3, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->e:Lv/VText;

    .line 197
    .line 198
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->button:Lcom/p1/mobile/putong/data/MessageCallToBuyButton;

    .line 199
    .line 200
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageCallToBuyButton;->text:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->e:Lv/VText;

    .line 218
    .line 219
    if-eqz p1, :cond_3

    .line 220
    .line 221
    sget p1, Ll/ibc0;->S3:I

    .line 222
    .line 223
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 224
    .line 225
    .line 226
    goto :goto_4

    .line 227
    :cond_3
    sget p1, Ll/ibc0;->z:I

    .line 228
    .line 229
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 230
    .line 231
    .line 232
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;

    .line 233
    .line 234
    new-instance v1, Ll/l9q;

    .line 235
    .line 236
    invoke-direct {v1, p0, v0}, Ll/l9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->e:Lv/VText;

    .line 243
    .line 244
    new-instance v1, Ll/m9q;

    .line 245
    .line 246
    invoke-direct {v1, p0, v0}, Ll/m9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 250
    .line 251
    .line 252
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->l(Ljava/lang/String;Z)V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
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
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n9q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final e()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->h(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "privilege"

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v1, v2}, Ll/r97;->O5(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "active"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-nez v3, :cond_2

    .line 58
    .line 59
    const-string v3, "quick_chat"

    .line 60
    .line 61
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_0

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {v3}, Ll/r97;->F5()Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-nez v3, :cond_0

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-interface {v1, p0, v0}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_0
    const-string v3, "voice_quick_chat"

    .line 98
    .line 99
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_1

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-interface {v2}, Ll/r97;->l2()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-lez v2, :cond_1

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-interface {v1, p0, v0}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string v2, "p_chat,assistant_quickchat"

    .line 148
    .line 149
    invoke-interface {v0, p0, v2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-interface {v1, p0, v0}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_3
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->i(Ljava/lang/String;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_5

    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-interface {v1, v2}, Ll/r97;->O5(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Privilege;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    if-eqz v2, :cond_4

    .line 202
    .line 203
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-eqz v2, :cond_4

    .line 216
    .line 217
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    const-string v2, "p_chat_view,e_assistant_see,click"

    .line 230
    .line 231
    invoke-interface {v0, p0, v2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-interface {v1, p0, v0}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_7

    .line 264
    .line 265
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 266
    .line 267
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_6

    .line 272
    .line 273
    const-string v0, "tantan://vip/see?from=assistant_card"

    .line 274
    .line 275
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 276
    .line 277
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->d()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 290
    .line 291
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-interface {v0, v1, p0}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    const-string v1, ""

    .line 312
    .line 313
    const/4 v2, 0x0

    .line 314
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->li(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 315
    .line 316
    .line 317
    return-void
.end method

.method public final f(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->h(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "quickchat"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->i(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string p0, "see"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string p0, "other"

    .line 20
    .line 21
    return-object p0
.end method

.method public final g(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "2"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "small_pics"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "3"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "large_pic"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "4"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "small_card_pic"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string p0, "5"

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    const-string p0, "large_card_pic"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    const-string p0, "content"

    .line 46
    .line 47
    return-object p0
.end method

.method public final h(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "tantanapp://quickChat2Floor"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final i(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "tantanapp://vip/see"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic j(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "assistant_types"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "card_ui"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "e_ctbscard"

    .line 28
    .line 29
    const-string v0, "p_chat_view"

    .line 30
    .line 31
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->e()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->l(Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "assistant_types"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "card_ui"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "father_e"

    .line 24
    .line 25
    const-string v1, "e_ctbscard"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {p2, p1, v0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "e_ctbscard_button"

    .line 36
    .line 37
    const-string v0, "p_chat_view"

    .line 38
    .line 39
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->e()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->f:Ljava/lang/String;

    .line 46
    .line 47
    const/4 p2, 0x0

    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->l(Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final l(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    :try_start_0
    new-instance p0, Ljava/net/URI;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v1, "tantan"

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_5

    .line 25
    .line 26
    const-string p1, "vip"

    .line 27
    .line 28
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    const-string v1, "quickchat"

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    :try_start_1
    const-string p1, "/quickchat"

    .line 37
    .line 38
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string p1, "/see"

    .line 46
    .line 47
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    const-string v1, "call2buysee"

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const-string p1, "/partner"

    .line 57
    .line 58
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    const-string v1, "supremePartner"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const-string p0, "quickChat2Floor"

    .line 68
    .line 69
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    const/4 v1, 0x0

    .line 77
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 81
    if-nez p0, :cond_5

    .line 82
    .line 83
    const-string p0, "vas_guide_type"

    .line 84
    .line 85
    const-string p1, "p_chat_view"

    .line 86
    .line 87
    const-string v0, "e_vas_guide_assistant"

    .line 88
    .line 89
    if-eqz p2, :cond_4

    .line 90
    .line 91
    :try_start_2
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    filled-new-array {p0}, [Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    filled-new-array {p0}, [Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 112
    .line 113
    .line 114
    :catch_0
    :cond_5
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageCallToBuy;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
