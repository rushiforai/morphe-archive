.class public Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/orl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView$NoUnderlineSpan;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Ll/sj6;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static c1(Ll/sj6;I)Landroid/text/SpannableStringBuilder;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/sj6;->T:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    sget v1, Ll/c9c0;->o:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :goto_0
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    if-lez p1, :cond_1

    .line 24
    .line 25
    const-string v2, "\u8bd5\u7528\u5230\u671f \u00b7 "

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 32
    .line 33
    .line 34
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 35
    .line 36
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v2, "%s\u6761\u65b0\u6d88\u606f"

    .line 45
    .line 46
    invoke-static {v0, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    sget v0, Ll/c9c0;->I:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-static {p1, p0}, Ll/kj6;->f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v1, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 63
    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_1
    const-string p0, "\u8bd5\u7528\u5230\u671f"

    .line 67
    .line 68
    invoke-static {p0, v0}, Ll/c17;->s0(Ljava/lang/String;I)Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v1, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    .line 75
    return-object v1
.end method

.method private getIntlLiveView()Ll/g1t;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Ll/g1t;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/g1t;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Uf(Landroid/content/Context;)Ll/g1t;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-interface {v0}, Ll/g1t;->getView()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

.method private setError(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Qb()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 16
    .line 17
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/joa;->M3()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    sget-object v0, Ll/for;->INSTANCE:Ll/for;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "trialEnd"

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_4

    .line 66
    .line 67
    const-string v1, "waiting"

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_4

    .line 78
    .line 79
    const-string v1, "expired"

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_0

    .line 90
    .line 91
    goto/16 :goto_1

    .line 92
    .line 93
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 94
    .line 95
    iget-object v0, v0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Ll/dbc0;->pi:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const/high16 v1, 0x41500000    # 13.0f

    .line 108
    .line 109
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    const/4 v3, 0x0

    .line 118
    invoke-virtual {v0, v3, v3, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 122
    .line 123
    const/4 v2, 0x0

    .line 124
    invoke-virtual {v1, v2, v2, v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 128
    .line 129
    const/high16 v1, 0x41400000    # 12.0f

    .line 130
    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 136
    .line 137
    .line 138
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_2

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    const-string v0, "failed"

    .line 149
    .line 150
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_2

    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 157
    .line 158
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-nez p1, :cond_2

    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 167
    .line 168
    iget-object p1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 169
    .line 170
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {}, Ll/gra;->z()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_1

    .line 179
    .line 180
    sget v0, Ll/dbc0;->wg:I

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_1
    sget v0, Ll/dbc0;->X7:I

    .line 184
    .line 185
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    invoke-virtual {p1, v3, v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 201
    .line 202
    invoke-virtual {v0, v2, v2, p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 203
    .line 204
    .line 205
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 206
    .line 207
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 208
    .line 209
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-eqz p1, :cond_4

    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 216
    .line 217
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 218
    .line 219
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 220
    .line 221
    const-string v0, "intlSeeChatRequest"

    .line 222
    .line 223
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_4

    .line 228
    .line 229
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 230
    .line 231
    invoke-virtual {p1, v2, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 235
    .line 236
    iget-object p1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 237
    .line 238
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    sget v0, Ll/dbc0;->t1:I

    .line 243
    .line 244
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    const/high16 v0, 0x41200000    # 10.0f

    .line 249
    .line 250
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    invoke-virtual {p1, v3, v3, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 259
    .line 260
    .line 261
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iget-object v0, v0, Ll/r8n;->b:Lrx/subjects/a;

    .line 266
    .line 267
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 272
    .line 273
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-eqz v1, :cond_4

    .line 278
    .line 279
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 280
    .line 281
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    if-eqz v1, :cond_4

    .line 286
    .line 287
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 288
    .line 289
    new-instance v1, Ll/bc6;

    .line 290
    .line 291
    invoke-direct {v1, p0}, Ll/bc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 299
    .line 300
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    if-eqz v1, :cond_3

    .line 305
    .line 306
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 307
    .line 308
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    if-eqz v0, :cond_3

    .line 313
    .line 314
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 315
    .line 316
    invoke-virtual {p0, v2, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 317
    .line 318
    .line 319
    return-void

    .line 320
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 321
    .line 322
    invoke-virtual {p0, v2, v2, p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 323
    .line 324
    .line 325
    :cond_4
    :goto_1
    return-void
.end method

.method private setRedDot(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setSparkIcon(Ll/pf60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Landroid/text/SpannableStringBuilder;",
            "Ll/z6m;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->b:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    instance-of p1, p1, Ll/dvf0;

    .line 10
    .line 11
    if-eqz p1, :cond_3

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 14
    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    if-eqz p1, :cond_3

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 22
    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    const/4 v2, 0x2

    .line 34
    if-ne p1, v2, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->b:Lv/VImage;

    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->b:Lv/VImage;

    .line 42
    .line 43
    sget p1, Ll/dbc0;->Z5:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->b:Lv/VImage;

    .line 50
    .line 51
    if-le p1, v2, :cond_2

    .line 52
    .line 53
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->b:Lv/VImage;

    .line 57
    .line 58
    sget p1, Ll/dbc0;->a6:I

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    :cond_3
    :goto_0
    return-void
.end method

.method private setSubtitleContent(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Qb()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 16
    .line 17
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/joa;->M3()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    sget-object v0, Ll/for;->INSTANCE:Ll/for;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "trialEnd"

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_0

    .line 66
    .line 67
    const-string v1, "waiting"

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_0

    .line 78
    .line 79
    const-string v1, "expired"

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/for;->e()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 92
    .line 93
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 94
    .line 95
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 96
    .line 97
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->c1(Ll/sj6;I)Landroid/text/SpannableStringBuilder;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 108
    .line 109
    invoke-static {v0, p1}, Ll/ndg0;->e(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v0, Ljava/lang/CharSequence;

    .line 116
    .line 117
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 124
    .line 125
    invoke-static {v0}, Ll/ndg0;->c(Ll/sj6;)Ljava/lang/CharSequence;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 130
    .line 131
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-nez v1, :cond_3

    .line 140
    .line 141
    invoke-static {v0}, Ll/hxj0;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f1(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 150
    .line 151
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    :cond_3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->setSparkIcon(Ll/pf60;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;Lcom/p1/mobile/putong/core/data/InsertConversationUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->d1(Lcom/p1/mobile/putong/core/data/InsertConversationUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A(Ll/sj6;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cc6;->a(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public E(Ll/sj6;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 18
    .line 19
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->setSubtitleContent(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 25
    .line 26
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 27
    .line 28
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 29
    .line 30
    if-lez v2, :cond_1

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move v2, v1

    .line 35
    :goto_0
    invoke-interface {p0, p1, v0, v1, v2}, Ll/ue6;->I(Ll/sj6;Landroid/widget/TextView;ZZ)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public F0(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public G0(Ll/sj6;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->R0:Ll/wyd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/CharSequence;

    .line 16
    .line 17
    const-string v1, "\u7279\u9080\u5609\u5bbe"

    .line 18
    .line 19
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->M0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public M0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    aget-object v0, v0, v1

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    aget-object v0, v0, v1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget v1, Ll/dbc0;->X7:I

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eq v0, p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method public P(Ll/sj6;)V
    .locals 11

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-boolean v0, p1, Ll/sj6;->u:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/sj6;->r:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    iget v0, p1, Ll/sj6;->H:I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v2, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {v0}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    new-instance v3, Ll/pri0;

    .line 40
    .line 41
    const/high16 v0, 0x41800000    # 16.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    const/16 v2, 0xa

    .line 48
    .line 49
    invoke-static {v2}, Ll/qa00;->f(I)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    sget v9, Ll/pri0;->k:I

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget v8, Ll/c9c0;->a1:I

    .line 65
    .line 66
    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v10

    .line 70
    const/4 v8, -0x1

    .line 71
    invoke-direct/range {v3 .. v10}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    add-int/lit8 v2, v2, -0x1

    .line 79
    .line 80
    mul-int/lit8 v2, v2, 0x6

    .line 81
    .line 82
    add-int/lit8 v2, v2, 0x10

    .line 83
    .line 84
    int-to-float v2, v2

    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    const/4 v4, 0x0

    .line 94
    invoke-virtual {v3, v4, v4, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {v0, v1, v1, v3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 103
    .line 104
    const/high16 v1, 0x41b80000    # 23.0f

    .line 105
    .line 106
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v0}, Ll/vb0;->h(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 122
    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    sget v0, Lcom/p1/mobile/putong/core/R$string;->I:I

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    iget-object p1, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 152
    .line 153
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Oa:I

    .line 158
    .line 159
    iget p1, p1, Ll/sj6;->N:I

    .line 160
    .line 161
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {v2, v3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 177
    .line 178
    invoke-virtual {p1, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 179
    .line 180
    .line 181
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g1()V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public Q0(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-interface {p0, p1}, Ll/ue6;->p(Ll/sj6;)Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->getOperationTopicInfo()Lcom/p1/mobile/putong/core/data/OperationTopicInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/OperationTopicInfo;->operationId:Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string v1, ""

    .line 36
    .line 37
    :goto_0
    iput-object v1, p1, Ll/sj6;->l:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 46
    .line 47
    const-string v2, "common_tip"

    .line 48
    .line 49
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_3

    .line 72
    .line 73
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 76
    .line 77
    const-string v2, "pat"

    .line 78
    .line 79
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra2:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->n2:Ljava/util/List;

    .line 100
    .line 101
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 102
    .line 103
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_3

    .line 108
    .line 109
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->n2:Ljava/util/List;

    .line 114
    .line 115
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    :cond_3
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_4

    .line 127
    .line 128
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 131
    .line 132
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->k2:Ljava/util/Set;

    .line 133
    .line 134
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 137
    .line 138
    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_4
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->setSubtitleContent(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->b1()V

    .line 145
    .line 146
    .line 147
    invoke-static {}, Ll/u7n;->d()Ll/z6m;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-interface {v1, p1, v0}, Ll/z6m;->a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->d:Landroid/view/View;

    .line 156
    .line 157
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->c:Lv/VText;

    .line 161
    .line 162
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->c:Lv/VText;

    .line 166
    .line 167
    invoke-static {}, Ll/u7n;->d()Ll/z6m;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-interface {v2, p1, v0}, Ll/z6m;->b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->setRedDot(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e1(Ll/sj6;)V

    .line 182
    .line 183
    .line 184
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->setError(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g1()V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public X0(Ll/sj6;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 16
    .line 17
    const-string p1, "\u6682\u65e0\u65b0\u7684\u597d\u53cb\u8bf7\u6c42"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 34
    .line 35
    const-string v2, "text"

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p1, Ll/sj6;->I:Lcom/p1/mobile/putong/core/data/Message;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 61
    .line 62
    const-string v2, "picture"

    .line 63
    .line 64
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    const-string v0, "[\u56fe\u7247]"

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    const-string v0, ""

    .line 74
    .line 75
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 76
    .line 77
    iget-object v3, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v3}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {p0, v3, v0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->M0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 95
    .line 96
    const-string v2, "city_c_cell_uid"

    .line 97
    .line 98
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    filled-new-array {v0}, [Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v2, "e_city_cover_received_greet"

    .line 107
    .line 108
    const-string v3, "p_messages_view"

    .line 109
    .line 110
    invoke-static {v2, v3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 114
    .line 115
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 116
    .line 117
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 118
    .line 119
    if-lez v2, :cond_3

    .line 120
    .line 121
    const/4 v2, 0x1

    .line 122
    goto :goto_1

    .line 123
    :cond_3
    move v2, v1

    .line 124
    :goto_1
    invoke-interface {p0, p1, v0, v1, v2}, Ll/ue6;->I(Ll/sj6;Landroid/widget/TextView;ZZ)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final b1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/ftn0;->k()Ll/m4s;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 27
    .line 28
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 37
    .line 38
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    const-string v4, "-1"

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    invoke-static {}, Ll/gra;->a2()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 62
    .line 63
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->getIntlLiveView()Ll/g1t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0, v0}, Ll/g1t;->P(Ll/m4s;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void

    .line 74
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 80
    .line 81
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public d(Ll/sj6;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v2, Ll/dbc0;->t1:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/high16 v2, 0x41200000    # 10.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-virtual {v0, v4, v4, v3, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {v2, v1, v1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 46
    .line 47
    const/high16 v1, 0x41b80000    # 23.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-interface {p0, p1}, Ll/ue6;->p(Ll/sj6;)Lcom/p1/mobile/putong/core/data/Message;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v0}, Ll/vb0;->h(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 89
    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget p1, Lcom/p1/mobile/putong/core/R$string;->I:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    return-void
.end method

.method public d0(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d1(Lcom/p1/mobile/putong/core/data/InsertConversationUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 4
    .line 5
    iget-object p0, p0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final e1(Ll/sj6;)V
    .locals 1
    .param p1    # Ll/sj6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Qb()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/joa;->M3()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_0

    .line 50
    .line 51
    sget-object p0, Ll/for;->INSTANCE:Ll/for;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/for;->e()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "trialEnd"

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_0

    .line 64
    .line 65
    const-string p1, "waiting"

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/for;->e()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_0

    .line 76
    .line 77
    const-string p1, "expired"

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/for;->e()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method

.method public f1(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 8

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const-class v1, Landroid/text/style/URLSpan;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-interface {v0, v2, p1, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, [Landroid/text/style/URLSpan;

    .line 18
    .line 19
    array-length v1, p1

    .line 20
    if-lez v1, :cond_0

    .line 21
    .line 22
    array-length v1, p1

    .line 23
    move v3, v2

    .line 24
    :goto_0
    if-ge v3, v1, :cond_0

    .line 25
    .line 26
    aget-object v4, p1, v3

    .line 27
    .line 28
    invoke-interface {v0, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-interface {v0, v4}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-interface {v0, v4}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance v7, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView$NoUnderlineSpan;

    .line 40
    .line 41
    invoke-virtual {v4}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-direct {v7, p0, v4}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView$NoUnderlineSpan;-><init>(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v7, v5, v6, v2}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    :cond_0
    return-object v0
.end method

.method public g1()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/sj6;->o:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "group"

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 22
    .line 23
    iget-object v0, v0, Ll/sj6;->p:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 32
    .line 33
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    move v0, v2

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move v0, v3

    .line 46
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 47
    .line 48
    invoke-static {v4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 52
    .line 53
    invoke-static {v4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 61
    .line 62
    iget-object v4, v4, Ll/sj6;->q:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 73
    .line 74
    iget-object v7, v4, Ll/sj6;->t:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    sget v8, Ll/c9c0;->I:I

    .line 85
    .line 86
    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    const/4 v9, 0x1

    .line 91
    const/4 v10, 0x1

    .line 92
    invoke-static/range {v5 .. v10}, Ll/qte;->b(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;IZZ)V

    .line 93
    .line 94
    .line 95
    move v4, v3

    .line 96
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 97
    .line 98
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-ge v4, v5, :cond_3

    .line 103
    .line 104
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 105
    .line 106
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 111
    .line 112
    if-eq v5, v6, :cond_2

    .line 113
    .line 114
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 121
    .line 122
    iget-object v4, v4, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 123
    .line 124
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-eqz v4, :cond_4

    .line 129
    .line 130
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 131
    .line 132
    iget-object v4, v4, Ll/sj6;->p:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-nez v4, :cond_4

    .line 139
    .line 140
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 141
    .line 142
    iget-object v4, v4, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 143
    .line 144
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_4

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_4
    move v2, v3

    .line 154
    :goto_2
    if-nez v0, :cond_6

    .line 155
    .line 156
    if-eqz v2, :cond_5

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :cond_5
    :goto_3
    return-void

    .line 160
    :cond_6
    :goto_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 161
    .line 162
    const/4 v0, 0x0

    .line 163
    invoke-virtual {p0, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public h0(Ll/sj6;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m0(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Ll/sj6;->P:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Ll/sj6;->P:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 36
    .line 37
    add-int/2addr v1, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->c1(Ll/sj6;I)Landroid/text/SpannableStringBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 14
    .line 15
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public r(Ljava/text/SimpleDateFormat;JJJ)V
    .locals 0

    .line 1
    cmp-long p6, p2, p4

    .line 2
    .line 3
    if-gez p6, :cond_0

    .line 4
    .line 5
    new-instance p6, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {p6}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    sub-long/2addr p4, p2

    .line 11
    invoke-virtual {p6, p4, p5}, Ljava/util/Date;->setTime(J)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget p3, Lcom/p1/mobile/putong/core/R$string;->hj:I

    .line 21
    .line 22
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public bridge synthetic setPicPercent(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/nrl;->setPicPercent(F)V

    return-void
.end method

.method public t0(Ll/sj6;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->f:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->g:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->h:Lv/VText;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p1, Ll/sj6;->v:Z

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 48
    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->e:Lv/VText;

    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "\u63a2\u63a2ID: "

    .line 57
    .line 58
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 75
    .line 76
    filled-new-array {v2}, [Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object p1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    sget v3, Ll/c9c0;->I:I

    .line 87
    .line 88
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v0, v2, p1, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 105
    .line 106
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 107
    .line 108
    invoke-interface {p0, p1}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    xor-int/2addr p0, v2

    .line 113
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public y0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->i:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/ue6;->Y(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemSubTitleView;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
