.class public Lv/VSearchBar;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# static fields
.field private static final CANCEL_BEHAVIOR_EXTINCT:I = 0x2

.field private static final CANCEL_BEHAVIOR_FLOAT:I = 0x0

.field private static final CANCEL_BEHAVIOR_PIN:I = 0x1


# instance fields
.field private cancelVisibleIndex:I

.field private mCancelListener:Landroid/view/View$OnClickListener;

.field private mCancelText:Lv/VText;

.field private mClearImg:Lv/VIcon;

.field private mClearLayout:Landroid/widget/FrameLayout;

.field private mClearListener:Landroid/view/View$OnClickListener;

.field private mEditText:Lv/VEditText;

.field private mFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

.field private mTextWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lv/VSearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lv/VSearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lv/VSearchBar;->cancelVisibleIndex:I

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lv/VSearchBar;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lv/VSearchBar;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/VSearchBar;->h(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic b(Lv/VSearchBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VSearchBar;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lv/VSearchBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VSearchBar;->g(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VSearchBar;->mClearLayout:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/16 v1, 0x8

    .line 12
    .line 13
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lv/VSearchBar;->mTextWatcher:Landroid/text/TextWatcher;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-interface {p0, p1}, Landroid/text/TextWatcher;->afterTextChanged(Landroid/text/Editable;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mTextWatcher:Landroid/text/TextWatcher;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/TextWatcher;->beforeTextChanged(Ljava/lang/CharSequence;III)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearFocus()V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Landroid/text/TextWatcher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSearchBar;->mTextWatcher:Landroid/text/TextWatcher;

    .line 2
    .line 3
    return-void
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 10

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/gec0;->v:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    sget v0, Ll/vcc0;->H:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lv/VEditText;

    .line 17
    .line 18
    iput-object v0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 19
    .line 20
    sget v0, Ll/vcc0;->X:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    iput-object v0, p0, Lv/VSearchBar;->mClearLayout:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    sget v0, Ll/vcc0;->p:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lv/VText;

    .line 37
    .line 38
    iput-object v0, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 39
    .line 40
    sget v0, Ll/vcc0;->T:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lv/VIcon;

    .line 47
    .line 48
    iput-object v0, p0, Lv/VSearchBar;->mClearImg:Lv/VIcon;

    .line 49
    .line 50
    iget-object v0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 51
    .line 52
    sget v1, Ll/abc0;->u:I

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/qnp0;->e1(Landroid/widget/TextView;I)V

    .line 55
    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    const/4 v1, -0x1

    .line 59
    const v2, 0x7fffffff

    .line 60
    .line 61
    .line 62
    if-eqz p2, :cond_0

    .line 63
    .line 64
    sget-object v3, Ll/hhc0;->a1:[I

    .line 65
    .line 66
    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget p2, Ll/hhc0;->h1:I

    .line 71
    .line 72
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    sget v3, Ll/hhc0;->i1:I

    .line 77
    .line 78
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    sget v4, Ll/hhc0;->d1:I

    .line 83
    .line 84
    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    sget v5, Ll/hhc0;->b1:I

    .line 89
    .line 90
    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    sget v6, Ll/hhc0;->c1:I

    .line 95
    .line 96
    invoke-virtual {p1, v6, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    sget v7, Ll/hhc0;->g1:I

    .line 101
    .line 102
    invoke-virtual {p1, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    sget v8, Ll/hhc0;->e1:I

    .line 107
    .line 108
    invoke-virtual {p1, v8, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    sget v9, Ll/hhc0;->f1:I

    .line 113
    .line 114
    invoke-virtual {p1, v9, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    iput v9, p0, Lv/VSearchBar;->cancelVisibleIndex:I

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_0
    const/4 v4, 0x0

    .line 125
    move p2, v1

    .line 126
    move v3, p2

    .line 127
    move v8, v3

    .line 128
    move v5, v2

    .line 129
    move v6, v5

    .line 130
    move-object v7, v4

    .line 131
    :goto_0
    if-eq p2, v1, :cond_1

    .line 132
    .line 133
    iget-object p1, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 134
    .line 135
    invoke-virtual {p1, p2, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 136
    .line 137
    .line 138
    :cond_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-nez p1, :cond_2

    .line 143
    .line 144
    iget-object p1, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 145
    .line 146
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    :cond_2
    if-eq v5, v2, :cond_3

    .line 150
    .line 151
    iget-object p1, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 152
    .line 153
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 154
    .line 155
    .line 156
    :cond_3
    if-eq v6, v2, :cond_4

    .line 157
    .line 158
    iget-object p1, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 159
    .line 160
    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 161
    .line 162
    .line 163
    :cond_4
    if-eq v3, v1, :cond_5

    .line 164
    .line 165
    iget-object p1, p0, Lv/VSearchBar;->mClearImg:Lv/VIcon;

    .line 166
    .line 167
    invoke-virtual {p1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 168
    .line 169
    .line 170
    :cond_5
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_6

    .line 175
    .line 176
    iget-object p1, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 177
    .line 178
    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    :cond_6
    if-eq v8, v1, :cond_7

    .line 182
    .line 183
    iget-object p1, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 184
    .line 185
    invoke-virtual {p1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 186
    .line 187
    .line 188
    :cond_7
    iget-object p1, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 189
    .line 190
    iget p2, p0, Lv/VSearchBar;->cancelVisibleIndex:I

    .line 191
    .line 192
    const/4 v1, 0x1

    .line 193
    if-ne p2, v1, :cond_8

    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_8
    const/16 v0, 0x8

    .line 197
    .line 198
    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 202
    .line 203
    new-instance p2, Ll/lzk0;

    .line 204
    .line 205
    invoke-direct {p2, p0}, Ll/lzk0;-><init>(Lv/VSearchBar;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Lv/VSearchBar;->mClearLayout:Landroid/widget/FrameLayout;

    .line 212
    .line 213
    new-instance p2, Ll/mzk0;

    .line 214
    .line 215
    invoke-direct {p2, p0}, Ll/mzk0;-><init>(Lv/VSearchBar;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 222
    .line 223
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 224
    .line 225
    .line 226
    iget-object p1, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 227
    .line 228
    new-instance p2, Ll/nzk0;

    .line 229
    .line 230
    invoke-direct {p2, p0}, Ll/nzk0;-><init>(Lv/VSearchBar;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 3

    .line 1
    iget v0, p0, Lv/VSearchBar;->cancelVisibleIndex:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 14
    .line 15
    const-string v1, ""

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lv/VSearchBar;->mClearLayout:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lv/VSearchBar;->mCancelListener:Landroid/view/View$OnClickListener;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lv/VSearchBar;->mClearLayout:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lv/VSearchBar;->mClearListener:Landroid/view/View$OnClickListener;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public getCancelText()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getClearLayout()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mClearLayout:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEditText()Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInput()Landroid/text/Editable;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic h(Landroid/view/View;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VSearchBar;->mFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p1, p0, Lv/VSearchBar;->cancelVisibleIndex:I

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    iget-object p0, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_2
    const/4 p2, 0x1

    .line 24
    if-eq p1, p2, :cond_4

    .line 25
    .line 26
    iget-object p1, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 27
    .line 28
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-lez p0, :cond_3

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_3
    const/16 v0, 0x8

    .line 42
    .line 43
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    :cond_4
    :goto_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    sget p2, Ll/qa00;->z:I

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mTextWatcher:Landroid/text/TextWatcher;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/TextWatcher;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setCancelListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSearchBar;->mCancelListener:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setCancelTextColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mCancelText:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setClearListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSearchBar;->mClearListener:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setEditTextBg(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setEditTextColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setEditTextHintColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSearchBar;->mFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public setLeftImageRes(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setRightImageRes(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VSearchBar;->mEditText:Lv/VEditText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lv/VSearchBar;->mClearImg:Lv/VIcon;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
