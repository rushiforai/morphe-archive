.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/data/Privilege;

.field public e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

.field public f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

.field public g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

.field public h:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;


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


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ee90;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    if-ne v0, v2, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->t0()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 43
    .line 44
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->voice_quick_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 45
    .line 46
    if-ne v0, v2, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->m0()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    if-ne v0, v1, :cond_3

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->h:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->h:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->f()V

    .line 77
    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    const/16 v4, 0x10

    .line 23
    .line 24
    const/4 v5, -0x1

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v1, Ll/rec0;->H0:I

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 51
    .line 52
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    invoke-direct {p2, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 58
    .line 59
    .line 60
    iput v4, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 72
    .line 73
    invoke-static {p0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    const/4 v0, 0x1

    .line 78
    invoke-static {v2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2$a;->a:[I

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    aget v0, v0, v2

    .line 90
    .line 91
    const/16 v2, 0x11

    .line 92
    .line 93
    const/4 v6, -0x2

    .line 94
    packed-switch v0, :pswitch_data_0

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sget v1, Ll/rec0;->H0:I

    .line 115
    .line 116
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 117
    .line 118
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 123
    .line 124
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 125
    .line 126
    .line 127
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 128
    .line 129
    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 130
    .line 131
    .line 132
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 133
    .line 134
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 135
    .line 136
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 140
    .line 141
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_3

    .line 149
    .line 150
    :pswitch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 151
    .line 152
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 160
    .line 161
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    sget v0, Ll/rec0;->f1:I

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 179
    .line 180
    invoke-virtual {p1, v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemHideMeFromNearby;

    .line 185
    .line 186
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemHideMeFromNearby;->b()V

    .line 187
    .line 188
    .line 189
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 190
    .line 191
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 192
    .line 193
    .line 194
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 197
    .line 198
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_3

    .line 202
    .line 203
    :pswitch_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 204
    .line 205
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 213
    .line 214
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->say_hi_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 222
    .line 223
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->f(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 228
    .line 229
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 230
    .line 231
    .line 232
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 235
    .line 236
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    .line 238
    .line 239
    goto/16 :goto_3

    .line 240
    .line 241
    :pswitch_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 242
    .line 243
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 251
    .line 252
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    sget v0, Ll/rec0;->M0:I

    .line 268
    .line 269
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 270
    .line 271
    invoke-virtual {p1, v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondService;

    .line 276
    .line 277
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondService;->b()V

    .line 278
    .line 279
    .line 280
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 281
    .line 282
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 283
    .line 284
    .line 285
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 286
    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 288
    .line 289
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 290
    .line 291
    .line 292
    goto/16 :goto_3

    .line 293
    .line 294
    :pswitch_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 295
    .line 296
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 304
    .line 305
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 313
    .line 314
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 319
    .line 320
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 321
    .line 322
    .line 323
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 324
    .line 325
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 326
    .line 327
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 328
    .line 329
    .line 330
    goto/16 :goto_3

    .line 331
    .line 332
    :pswitch_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 333
    .line 334
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    .line 340
    .line 341
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 342
    .line 343
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    sget v0, Ll/rec0;->N0:I

    .line 359
    .line 360
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 361
    .line 362
    invoke-virtual {p1, v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondSkin;

    .line 367
    .line 368
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondSkin;->b()V

    .line 369
    .line 370
    .line 371
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 372
    .line 373
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 374
    .line 375
    .line 376
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 377
    .line 378
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 379
    .line 380
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 381
    .line 382
    .line 383
    goto/16 :goto_3

    .line 384
    .line 385
    :pswitch_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 386
    .line 387
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    sget v1, Ll/rec0;->R0:I

    .line 403
    .line 404
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 405
    .line 406
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVIPBadgeView;

    .line 411
    .line 412
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVIPBadgeView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 413
    .line 414
    .line 415
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 416
    .line 417
    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 418
    .line 419
    .line 420
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 421
    .line 422
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 423
    .line 424
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 425
    .line 426
    .line 427
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 428
    .line 429
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 434
    .line 435
    .line 436
    goto/16 :goto_3

    .line 437
    .line 438
    :pswitch_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    sget v1, Ll/rec0;->U0:I

    .line 447
    .line 448
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 449
    .line 450
    invoke-virtual {v0, v1, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 451
    .line 452
    .line 453
    move-result-object v0

    .line 454
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnlockOnlineView;

    .line 455
    .line 456
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 457
    .line 458
    .line 459
    move-result-object v1

    .line 460
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 461
    .line 462
    .line 463
    move-result-object v1

    .line 464
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 465
    .line 466
    .line 467
    move-result v1

    .line 468
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnlockOnlineView;->b(Z)V

    .line 469
    .line 470
    .line 471
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 472
    .line 473
    invoke-direct {v1, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 474
    .line 475
    .line 476
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 477
    .line 478
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 479
    .line 480
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 481
    .line 482
    .line 483
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 484
    .line 485
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 486
    .line 487
    .line 488
    move-result-object v1

    .line 489
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 493
    .line 494
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 495
    .line 496
    .line 497
    move-result-object p1

    .line 498
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 499
    .line 500
    .line 501
    goto/16 :goto_3

    .line 502
    .line 503
    :pswitch_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 504
    .line 505
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 506
    .line 507
    .line 508
    move-result-object v4

    .line 509
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 510
    .line 511
    .line 512
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 517
    .line 518
    .line 519
    move-result-object v0

    .line 520
    sget v4, Ll/rec0;->H0:I

    .line 521
    .line 522
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 523
    .line 524
    invoke-virtual {v0, v4, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 529
    .line 530
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 531
    .line 532
    .line 533
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 534
    .line 535
    invoke-direct {v3, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 536
    .line 537
    .line 538
    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 539
    .line 540
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 541
    .line 542
    invoke-virtual {v2, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 543
    .line 544
    .line 545
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 550
    .line 551
    .line 552
    move-result-object p1

    .line 553
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object p1

    .line 557
    const-string v2, "1000+"

    .line 558
    .line 559
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 560
    .line 561
    .line 562
    move-result v2

    .line 563
    if-eq v2, v5, :cond_1

    .line 564
    .line 565
    new-instance p1, Ll/smd0;

    .line 566
    .line 567
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 568
    .line 569
    .line 570
    move-result-object v3

    .line 571
    const/high16 v4, 0x40400000    # 3.0f

    .line 572
    .line 573
    invoke-static {v3, v4}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 574
    .line 575
    .line 576
    move-result v3

    .line 577
    const-string v4, "#f2bd61"

    .line 578
    .line 579
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 580
    .line 581
    .line 582
    move-result v4

    .line 583
    const-string v5, "#ffffff"

    .line 584
    .line 585
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 586
    .line 587
    .line 588
    move-result v5

    .line 589
    new-instance v6, Ll/smd0$a;

    .line 590
    .line 591
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 592
    .line 593
    invoke-virtual {v7}, Landroid/widget/TextView;->getTextSize()F

    .line 594
    .line 595
    .line 596
    move-result v7

    .line 597
    add-int/lit8 v8, v2, 0x5

    .line 598
    .line 599
    invoke-direct {v6, v1, v7, v8}, Ll/smd0$a;-><init>(IFI)V

    .line 600
    .line 601
    .line 602
    filled-new-array {v6}, [Ll/smd0$a;

    .line 603
    .line 604
    .line 605
    move-result-object v1

    .line 606
    invoke-direct {p1, v3, v4, v5, v1}, Ll/smd0;-><init>(III[Ll/smd0$a;)V

    .line 607
    .line 608
    .line 609
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 610
    .line 611
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 612
    .line 613
    .line 614
    const/16 v0, 0x12

    .line 615
    .line 616
    invoke-virtual {v1, p1, v2, v8, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 617
    .line 618
    .line 619
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 620
    .line 621
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 622
    .line 623
    .line 624
    goto/16 :goto_3

    .line 625
    .line 626
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 627
    .line 628
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 629
    .line 630
    .line 631
    goto/16 :goto_3

    .line 632
    .line 633
    :pswitch_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 634
    .line 635
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->leave_message:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 636
    .line 637
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 638
    .line 639
    if-ne v0, v1, :cond_2

    .line 640
    .line 641
    const-string v0, "\u6bcf\u59295\u6761\u8d44\u6599\u7559\u8a00"

    .line 642
    .line 643
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 644
    .line 645
    .line 646
    goto :goto_0

    .line 647
    :cond_2
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 648
    .line 649
    .line 650
    move-result-object v0

    .line 651
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 652
    .line 653
    .line 654
    :goto_0
    new-instance v0, Landroid/widget/ImageView;

    .line 655
    .line 656
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 657
    .line 658
    .line 659
    move-result-object v1

    .line 660
    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 661
    .line 662
    .line 663
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 664
    .line 665
    .line 666
    move-result v1

    .line 667
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 668
    .line 669
    .line 670
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 671
    .line 672
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 673
    .line 674
    .line 675
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 676
    .line 677
    invoke-direct {v1, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 678
    .line 679
    .line 680
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 681
    .line 682
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 683
    .line 684
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 685
    .line 686
    .line 687
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 688
    .line 689
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 690
    .line 691
    .line 692
    move-result-object p1

    .line 693
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 694
    .line 695
    .line 696
    goto/16 :goto_3

    .line 697
    .line 698
    :pswitch_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 699
    .line 700
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 701
    .line 702
    .line 703
    move-result-object v1

    .line 704
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    .line 706
    .line 707
    new-instance v0, Landroid/widget/ImageView;

    .line 708
    .line 709
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 710
    .line 711
    .line 712
    move-result-object v1

    .line 713
    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 714
    .line 715
    .line 716
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 717
    .line 718
    .line 719
    move-result v1

    .line 720
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 721
    .line 722
    .line 723
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 724
    .line 725
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 726
    .line 727
    .line 728
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 729
    .line 730
    invoke-direct {v1, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 731
    .line 732
    .line 733
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 734
    .line 735
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 736
    .line 737
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 738
    .line 739
    .line 740
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 741
    .line 742
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 743
    .line 744
    .line 745
    move-result-object p1

    .line 746
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 747
    .line 748
    .line 749
    goto/16 :goto_3

    .line 750
    .line 751
    :pswitch_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 752
    .line 753
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 754
    .line 755
    .line 756
    move-result-object v1

    .line 757
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 758
    .line 759
    .line 760
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 761
    .line 762
    .line 763
    move-result-object v0

    .line 764
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 765
    .line 766
    .line 767
    move-result-object v0

    .line 768
    sget v1, Ll/rec0;->K0:I

    .line 769
    .line 770
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 771
    .line 772
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 773
    .line 774
    .line 775
    move-result-object v0

    .line 776
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;

    .line 777
    .line 778
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;->b()V

    .line 779
    .line 780
    .line 781
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 782
    .line 783
    invoke-direct {v1, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 784
    .line 785
    .line 786
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 787
    .line 788
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 789
    .line 790
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 791
    .line 792
    .line 793
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 794
    .line 795
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 796
    .line 797
    .line 798
    move-result-object p1

    .line 799
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 800
    .line 801
    .line 802
    goto/16 :goto_3

    .line 803
    .line 804
    :pswitch_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 805
    .line 806
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 807
    .line 808
    .line 809
    move-result-object v1

    .line 810
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 811
    .line 812
    .line 813
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 814
    .line 815
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 816
    .line 817
    .line 818
    move-result-object p1

    .line 819
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 820
    .line 821
    .line 822
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 823
    .line 824
    .line 825
    move-result-object p1

    .line 826
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 827
    .line 828
    .line 829
    move-result-object p1

    .line 830
    sget v0, Ll/rec0;->s2:I

    .line 831
    .line 832
    const/4 v1, 0x0

    .line 833
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 834
    .line 835
    .line 836
    move-result-object p1

    .line 837
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 838
    .line 839
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 840
    .line 841
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->i0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 842
    .line 843
    .line 844
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 845
    .line 846
    invoke-direct {p1, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 847
    .line 848
    .line 849
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 850
    .line 851
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 852
    .line 853
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 854
    .line 855
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 856
    .line 857
    .line 858
    goto/16 :goto_3

    .line 859
    .line 860
    :pswitch_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 861
    .line 862
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 863
    .line 864
    .line 865
    move-result-object v1

    .line 866
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 867
    .line 868
    .line 869
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 870
    .line 871
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 872
    .line 873
    .line 874
    move-result-object v1

    .line 875
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 876
    .line 877
    .line 878
    invoke-static {}, Ll/s7a;->h()Z

    .line 879
    .line 880
    .line 881
    move-result v0

    .line 882
    if-eqz v0, :cond_3

    .line 883
    .line 884
    invoke-static {p2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 885
    .line 886
    .line 887
    move-result v0

    .line 888
    if-eqz v0, :cond_3

    .line 889
    .line 890
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 891
    .line 892
    .line 893
    move-result-object v0

    .line 894
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 895
    .line 896
    .line 897
    move-result-object v0

    .line 898
    sget v1, Ll/rec0;->H0:I

    .line 899
    .line 900
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 901
    .line 902
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 903
    .line 904
    .line 905
    move-result-object v0

    .line 906
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 907
    .line 908
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->c(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 909
    .line 910
    .line 911
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 912
    .line 913
    invoke-direct {p1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 914
    .line 915
    .line 916
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 917
    .line 918
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 919
    .line 920
    invoke-virtual {v1, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 921
    .line 922
    .line 923
    goto/16 :goto_3

    .line 924
    .line 925
    :cond_3
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 926
    .line 927
    .line 928
    move-result p1

    .line 929
    if-eqz p1, :cond_4

    .line 930
    .line 931
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 932
    .line 933
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 934
    .line 935
    .line 936
    move-result-object p1

    .line 937
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 938
    .line 939
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 940
    .line 941
    .line 942
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 943
    .line 944
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 945
    .line 946
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 947
    .line 948
    .line 949
    goto/16 :goto_3

    .line 950
    .line 951
    :cond_4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 952
    .line 953
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 954
    .line 955
    .line 956
    move-result-object v0

    .line 957
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;-><init>(Landroid/content/Context;)V

    .line 958
    .line 959
    .line 960
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 961
    .line 962
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 963
    .line 964
    invoke-direct {p1, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 965
    .line 966
    .line 967
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 968
    .line 969
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 970
    .line 971
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 972
    .line 973
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 974
    .line 975
    .line 976
    goto/16 :goto_3

    .line 977
    .line 978
    :pswitch_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 979
    .line 980
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 981
    .line 982
    .line 983
    move-result-object v1

    .line 984
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->m7:I

    .line 985
    .line 986
    invoke-virtual {v1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 987
    .line 988
    .line 989
    move-result-object v1

    .line 990
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 991
    .line 992
    .line 993
    invoke-static {}, Ll/s7a;->h()Z

    .line 994
    .line 995
    .line 996
    move-result v0

    .line 997
    if-eqz v0, :cond_5

    .line 998
    .line 999
    invoke-static {p2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1000
    .line 1001
    .line 1002
    move-result v0

    .line 1003
    if-eqz v0, :cond_5

    .line 1004
    .line 1005
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v0

    .line 1009
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1010
    .line 1011
    .line 1012
    move-result-object v0

    .line 1013
    sget v1, Ll/rec0;->Q0:I

    .line 1014
    .line 1015
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1016
    .line 1017
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 1022
    .line 1023
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->h:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 1024
    .line 1025
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 1026
    .line 1027
    .line 1028
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1029
    .line 1030
    invoke-direct {p1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1031
    .line 1032
    .line 1033
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1034
    .line 1035
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1036
    .line 1037
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->h:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 1038
    .line 1039
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1040
    .line 1041
    .line 1042
    goto :goto_1

    .line 1043
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1044
    .line 1045
    .line 1046
    move-result-object p1

    .line 1047
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1048
    .line 1049
    .line 1050
    move-result-object p1

    .line 1051
    sget v0, Ll/rec0;->L2:I

    .line 1052
    .line 1053
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1054
    .line 1055
    invoke-virtual {p1, v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1056
    .line 1057
    .line 1058
    move-result-object p1

    .line 1059
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 1060
    .line 1061
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 1062
    .line 1063
    const v0, 0x3f4ccccd    # 0.8f

    .line 1064
    .line 1065
    .line 1066
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->setScale(F)V

    .line 1067
    .line 1068
    .line 1069
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1070
    .line 1071
    invoke-direct {p1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1072
    .line 1073
    .line 1074
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1075
    .line 1076
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1077
    .line 1078
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 1079
    .line 1080
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1081
    .line 1082
    .line 1083
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1084
    .line 1085
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1086
    .line 1087
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 1088
    .line 1089
    .line 1090
    move-result-object p1

    .line 1091
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1092
    .line 1093
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1094
    .line 1095
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->x5()Lcom/p1/mobile/putong/data/User;

    .line 1096
    .line 1097
    .line 1098
    move-result-object v0

    .line 1099
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1100
    .line 1101
    .line 1102
    move-result-object v1

    .line 1103
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1104
    .line 1105
    .line 1106
    move-result-object v1

    .line 1107
    invoke-interface {v1, v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vb(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Z

    .line 1108
    .line 1109
    .line 1110
    move-result v1

    .line 1111
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 1112
    .line 1113
    if-eqz v1, :cond_6

    .line 1114
    .line 1115
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1116
    .line 1117
    .line 1118
    move-result-object p1

    .line 1119
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1120
    .line 1121
    .line 1122
    move-result-object p1

    .line 1123
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->yl(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 1124
    .line 1125
    .line 1126
    move-result-object p1

    .line 1127
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1128
    .line 1129
    .line 1130
    goto/16 :goto_3

    .line 1131
    .line 1132
    :cond_6
    if-nez p1, :cond_7

    .line 1133
    .line 1134
    goto :goto_2

    .line 1135
    :cond_7
    iget v3, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 1136
    .line 1137
    :goto_2
    invoke-static {v3}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 1138
    .line 1139
    .line 1140
    move-result-object p1

    .line 1141
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1142
    .line 1143
    .line 1144
    goto/16 :goto_3

    .line 1145
    .line 1146
    :pswitch_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 1147
    .line 1148
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1149
    .line 1150
    .line 1151
    move-result-object v1

    .line 1152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1153
    .line 1154
    .line 1155
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 1156
    .line 1157
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1158
    .line 1159
    .line 1160
    move-result-object v1

    .line 1161
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1162
    .line 1163
    .line 1164
    invoke-static {}, Ll/s7a;->h()Z

    .line 1165
    .line 1166
    .line 1167
    move-result v0

    .line 1168
    if-eqz v0, :cond_8

    .line 1169
    .line 1170
    invoke-static {p2}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1171
    .line 1172
    .line 1173
    move-result v0

    .line 1174
    if-eqz v0, :cond_8

    .line 1175
    .line 1176
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1177
    .line 1178
    .line 1179
    move-result-object v0

    .line 1180
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v0

    .line 1184
    sget v1, Ll/rec0;->H0:I

    .line 1185
    .line 1186
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1187
    .line 1188
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1189
    .line 1190
    .line 1191
    move-result-object v0

    .line 1192
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 1193
    .line 1194
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 1195
    .line 1196
    .line 1197
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1198
    .line 1199
    invoke-direct {p1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1200
    .line 1201
    .line 1202
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1203
    .line 1204
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1205
    .line 1206
    invoke-virtual {v1, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1207
    .line 1208
    .line 1209
    goto/16 :goto_3

    .line 1210
    .line 1211
    :cond_8
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1212
    .line 1213
    .line 1214
    move-result p1

    .line 1215
    if-eqz p1, :cond_9

    .line 1216
    .line 1217
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 1218
    .line 1219
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 1220
    .line 1221
    .line 1222
    move-result-object p1

    .line 1223
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 1224
    .line 1225
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1226
    .line 1227
    .line 1228
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1229
    .line 1230
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1231
    .line 1232
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1233
    .line 1234
    .line 1235
    goto/16 :goto_3

    .line 1236
    .line 1237
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1238
    .line 1239
    .line 1240
    move-result-object p1

    .line 1241
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1242
    .line 1243
    .line 1244
    move-result-object p1

    .line 1245
    sget v0, Ll/rec0;->P0:I

    .line 1246
    .line 1247
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1248
    .line 1249
    invoke-virtual {p1, v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1250
    .line 1251
    .line 1252
    move-result-object p1

    .line 1253
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSuperLikeView;

    .line 1254
    .line 1255
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSuperLikeView;->b()V

    .line 1256
    .line 1257
    .line 1258
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 1259
    .line 1260
    invoke-direct {v0, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1261
    .line 1262
    .line 1263
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1264
    .line 1265
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1266
    .line 1267
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1268
    .line 1269
    .line 1270
    goto/16 :goto_3

    .line 1271
    .line 1272
    :pswitch_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 1273
    .line 1274
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1275
    .line 1276
    .line 1277
    move-result-object v1

    .line 1278
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1279
    .line 1280
    .line 1281
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 1282
    .line 1283
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1284
    .line 1285
    .line 1286
    move-result-object v1

    .line 1287
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1288
    .line 1289
    .line 1290
    invoke-static {}, Ll/s7a;->h()Z

    .line 1291
    .line 1292
    .line 1293
    move-result v0

    .line 1294
    if-eqz v0, :cond_a

    .line 1295
    .line 1296
    invoke-static {p2}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1297
    .line 1298
    .line 1299
    move-result v0

    .line 1300
    if-eqz v0, :cond_a

    .line 1301
    .line 1302
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1303
    .line 1304
    .line 1305
    move-result-object v0

    .line 1306
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v0

    .line 1310
    sget v1, Ll/rec0;->H0:I

    .line 1311
    .line 1312
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1313
    .line 1314
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1315
    .line 1316
    .line 1317
    move-result-object v0

    .line 1318
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 1319
    .line 1320
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->e(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 1321
    .line 1322
    .line 1323
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1324
    .line 1325
    invoke-direct {p1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1326
    .line 1327
    .line 1328
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1329
    .line 1330
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1331
    .line 1332
    invoke-virtual {v1, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1333
    .line 1334
    .line 1335
    goto/16 :goto_3

    .line 1336
    .line 1337
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1338
    .line 1339
    .line 1340
    move-result-object p1

    .line 1341
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1342
    .line 1343
    .line 1344
    move-result-object p1

    .line 1345
    sget v0, Ll/rec0;->T0:I

    .line 1346
    .line 1347
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1348
    .line 1349
    invoke-virtual {p1, v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1350
    .line 1351
    .line 1352
    move-result-object p1

    .line 1353
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;

    .line 1354
    .line 1355
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->b()V

    .line 1356
    .line 1357
    .line 1358
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 1359
    .line 1360
    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1361
    .line 1362
    .line 1363
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1364
    .line 1365
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1366
    .line 1367
    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1368
    .line 1369
    .line 1370
    goto :goto_3

    .line 1371
    :pswitch_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 1372
    .line 1373
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1374
    .line 1375
    .line 1376
    move-result-object v1

    .line 1377
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1378
    .line 1379
    .line 1380
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1381
    .line 1382
    .line 1383
    move-result-object v0

    .line 1384
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1385
    .line 1386
    .line 1387
    move-result-object v0

    .line 1388
    sget v1, Ll/rec0;->S0:I

    .line 1389
    .line 1390
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1391
    .line 1392
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1393
    .line 1394
    .line 1395
    move-result-object v0

    .line 1396
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUndoView;

    .line 1397
    .line 1398
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUndoView;->b()V

    .line 1399
    .line 1400
    .line 1401
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1402
    .line 1403
    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1404
    .line 1405
    .line 1406
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1407
    .line 1408
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1409
    .line 1410
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1411
    .line 1412
    .line 1413
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 1414
    .line 1415
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1416
    .line 1417
    .line 1418
    move-result-object p1

    .line 1419
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1420
    .line 1421
    .line 1422
    goto :goto_3

    .line 1423
    :pswitch_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 1424
    .line 1425
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1426
    .line 1427
    .line 1428
    move-result-object v1

    .line 1429
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1430
    .line 1431
    .line 1432
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1433
    .line 1434
    .line 1435
    move-result-object v0

    .line 1436
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1437
    .line 1438
    .line 1439
    move-result-object v0

    .line 1440
    sget v1, Ll/rec0;->V0:I

    .line 1441
    .line 1442
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1443
    .line 1444
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1445
    .line 1446
    .line 1447
    move-result-object v0

    .line 1448
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeVIPBadgeView;

    .line 1449
    .line 1450
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeVIPBadgeView;->b()V

    .line 1451
    .line 1452
    .line 1453
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1454
    .line 1455
    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1456
    .line 1457
    .line 1458
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1459
    .line 1460
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 1461
    .line 1462
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1463
    .line 1464
    .line 1465
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 1466
    .line 1467
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1468
    .line 1469
    .line 1470
    move-result-object p1

    .line 1471
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1472
    .line 1473
    .line 1474
    :goto_3
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1475
    .line 1476
    .line 1477
    move-result p1

    .line 1478
    if-eqz p1, :cond_b

    .line 1479
    .line 1480
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 1481
    .line 1482
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b()Lcom/p1/mobile/android/app/Act;

    .line 1483
    .line 1484
    .line 1485
    move-result-object p2

    .line 1486
    sget v0, Ll/h9c0;->x:I

    .line 1487
    .line 1488
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 1489
    .line 1490
    .line 1491
    move-result p2

    .line 1492
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1493
    .line 1494
    .line 1495
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c:Lv/VText;

    .line 1496
    .line 1497
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b()Lcom/p1/mobile/android/app/Act;

    .line 1498
    .line 1499
    .line 1500
    move-result-object p0

    .line 1501
    sget p2, Ll/h9c0;->y:I

    .line 1502
    .line 1503
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 1504
    .line 1505
    .line 1506
    move-result p0

    .line 1507
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1508
    .line 1509
    .line 1510
    :cond_b
    return-void

    .line 1511
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_11
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/rec0;->L0:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;
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
    sget v1, Ll/rec0;->g1:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemSVipSayHiView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemSVipSayHiView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
