.class public Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;
.super Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
.source "SourceFile"


# static fields
.field public static final m:I


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/AutoVDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VButton;

.field public k:F

.field public l:Ll/a0n;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->f:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->m:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->g(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->b:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->l:Ll/a0n;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/zzm;->J()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->l:Ll/a0n;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/a0n;->f()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->i:Lv/VText;

    .line 4
    .line 5
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->g:Lv/VText;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->i:Lv/VText;

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->h:Lv/VText;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    goto/16 :goto_4

    .line 39
    .line 40
    :cond_0
    const/4 p2, 0x1

    .line 41
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->h:Lv/VText;

    .line 45
    .line 46
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v0, :cond_5

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    const/4 v3, -0x1

    .line 63
    sparse-switch v2, :sswitch_data_0

    .line 64
    .line 65
    .line 66
    :goto_0
    move p2, v3

    .line 67
    goto :goto_1

    .line 68
    :sswitch_0
    const-string p2, "following"

    .line 69
    .line 70
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const/4 p2, 0x3

    .line 78
    goto :goto_1

    .line 79
    :sswitch_1
    const-string p2, "liked"

    .line 80
    .line 81
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-nez p2, :cond_2

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    const/4 p2, 0x2

    .line 89
    goto :goto_1

    .line 90
    :sswitch_2
    const-string v2, "friends"

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_4

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_3
    const-string p2, "super_like"

    .line 100
    .line 101
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-nez p2, :cond_3

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    move p2, v1

    .line 109
    :cond_4
    :goto_1
    packed-switch p2, :pswitch_data_0

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :pswitch_0
    sget p2, Ll/dbc0;->b9:I

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :pswitch_1
    sget p2, Ll/dbc0;->d9:I

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :pswitch_2
    sget p2, Ll/dbc0;->c9:I

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :pswitch_3
    sget p2, Ll/dbc0;->e9:I

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_5
    :goto_2
    move p2, v1

    .line 126
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->h:Lv/VText;

    .line 127
    .line 128
    sget v2, Ll/qa00;->c:I

    .line 129
    .line 130
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->h:Lv/VText;

    .line 134
    .line 135
    invoke-virtual {v0, p2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 136
    .line 137
    .line 138
    :goto_4
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-nez p2, :cond_6

    .line 145
    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->j:Lv/VButton;

    .line 147
    .line 148
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    :cond_6
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->d:Lv/VDraweeView;

    .line 156
    .line 157
    const-string v1, "https://static.tancdn.com/pe-webplatform/N_ecHA8oYXuERuDq5O45dXsa.webp"

    .line 158
    .line 159
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    if-nez p2, :cond_7

    .line 169
    .line 170
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->f:Lv/AutoVDraweeView;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {p2, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->e:Lv/VImage;

    .line 178
    .line 179
    new-instance p2, Ll/i0t;

    .line 180
    .line 181
    invoke-direct {p2, p0}, Ll/i0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;)V

    .line 182
    .line 183
    .line 184
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->j:Lv/VButton;

    .line 188
    .line 189
    new-instance p2, Ll/j0t;

    .line 190
    .line 191
    invoke-direct {p2, p0}, Ll/j0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    nop

    .line 199
    :sswitch_data_0
    .sparse-switch
        -0x666c9225 -> :sswitch_3
        -0x23c4b66b -> :sswitch_2
        0x62343ad -> :sswitch_1
        0x2da6f291 -> :sswitch_0
    .end sparse-switch

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k0t;->a(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getHideAnim()Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    neg-int v0, v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    aput v2, v1, v3

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    aput v0, v1, v2

    .line 20
    .line 21
    const-string v0, "translationY"

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-wide/16 v0, 0x190

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public getShowAnim()Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    neg-int v0, v0

    .line 10
    int-to-float v0, v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-float/2addr v0, v1

    .line 16
    const/4 v1, 0x2

    .line 17
    new-array v1, v1, [F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    aput v0, v1, v2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    const/4 v2, 0x1

    .line 24
    aput v0, v1, v2

    .line 25
    .line 26
    const-string v0, "translationY"

    .line 27
    .line 28
    invoke-static {p0, v0, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-wide/16 v0, 0x190

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public h(Ll/a0n;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a0n<",
            "*>;)",
            "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->l:Ll/a0n;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->k:F

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-float/2addr v0, v1

    .line 18
    sget v1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->m:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    cmpl-float v0, v0, v1

    .line 22
    .line 23
    if-lez v0, :cond_2

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->k:F

    .line 32
    .line 33
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a:Ll/x20;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->k:F

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    sub-float/2addr v0, v2

    .line 28
    sget v2, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalBigStyle4VirtualVoicePushView;->m:I

    .line 29
    .line 30
    int-to-float v2, v2

    .line 31
    cmpl-float v0, v0, v2

    .line 32
    .line 33
    if-lez v0, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a:Ll/x20;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a:Ll/x20;

    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method
