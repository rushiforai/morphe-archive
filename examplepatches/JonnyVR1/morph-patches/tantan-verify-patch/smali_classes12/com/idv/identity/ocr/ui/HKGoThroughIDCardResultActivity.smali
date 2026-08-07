.class public Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;
.super Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;
.source "SourceFile"


# instance fields
.field private A:Landroid/widget/EditText;

.field private B:Landroid/widget/EditText;

.field private C:Landroid/widget/EditText;

.field private D:Landroid/widget/EditText;

.field private E:Landroid/widget/EditText;

.field private F:Landroid/widget/EditText;

.field private G:Landroid/widget/EditText;

.field private H:Landroid/widget/EditText;

.field private I:Landroid/widget/Button;

.field private z:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->e2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z1(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a2(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b2(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 2
    .line 3
    return-object p0
.end method

.method private c2()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/cfm;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "^C[0-9]{8}|C[A-HJ-NP-Za-z][0-9]{7}$"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "^[HM][0-9]{8}$"

    .line 37
    .line 38
    invoke-static {v0, p0}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method private d2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    new-instance v1, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$d;-><init>(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 12
    .line 13
    new-instance v1, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$e;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$e;-><init>(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 22
    .line 23
    new-instance v1, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$f;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$f;-><init>(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private e2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "^[\\u4e00-\\u9fa5\u00b7]{2,20}$"

    .line 22
    .line 23
    invoke-static {v2, v0}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v3, 0x1

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget v0, Lcom/idv/identity/base/R$string;->w0:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->X0(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    sget v5, Ll/yac0;->k:I

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    move v0, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    sget v5, Ll/yac0;->j:I

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    move v0, v3

    .line 69
    :goto_0
    const-string v4, "^[A-Za-z,\'-\u00b7\\s]{2,50}$"

    .line 70
    .line 71
    invoke-static {v4, v1}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_1

    .line 76
    .line 77
    sget v0, Lcom/idv/identity/base/R$string;->n0:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->X0(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    sget v4, Ll/yac0;->k:I

    .line 89
    .line 90
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    move v0, v2

    .line 98
    goto :goto_1

    .line 99
    :cond_1
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    sget v5, Ll/yac0;->j:I

    .line 106
    .line 107
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    :goto_1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->c2()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_2

    .line 119
    .line 120
    sget v0, Lcom/idv/identity/base/R$string;->s0:I

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->X0(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    sget v4, Ll/yac0;->k:I

    .line 132
    .line 133
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    move v0, v2

    .line 141
    goto :goto_2

    .line 142
    :cond_2
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    sget v5, Ll/yac0;->j:I

    .line 149
    .line 150
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    :goto_2
    if-nez v0, :cond_4

    .line 158
    .line 159
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 160
    .line 161
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 165
    .line 166
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 171
    .line 172
    if-eqz v0, :cond_3

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    sget v3, Ll/y9c0;->e:I

    .line 179
    .line 180
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 185
    .line 186
    .line 187
    :cond_3
    invoke-virtual {p0, v2}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_4
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->E1()V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 195
    .line 196
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->I1()V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0, v3}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 203
    .line 204
    .line 205
    return-void
.end method


# virtual methods
.method public H1()V
    .locals 1

    .line 1
    sget v0, Ll/dec0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->englishName:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->idNumber:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->sex:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 110
    .line 111
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->birthDate:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 132
    .line 133
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 134
    .line 135
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->issueDate:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 156
    .line 157
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 158
    .line 159
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->expiryDate:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 180
    .line 181
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 182
    .line 183
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->placeOfIssue:Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 202
    .line 203
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 204
    .line 205
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 206
    .line 207
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    iput-object p0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->originOfIssue:Ljava/lang/String;

    .line 216
    .line 217
    return-void
.end method

.method public f1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 50
    .line 51
    .line 52
    sget v0, Ll/rcc0;->p:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/widget/ScrollView;

    .line 59
    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    new-instance v1, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$a;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$a;-><init>(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public j1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 50
    .line 51
    .line 52
    sget v0, Ll/rcc0;->p:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/widget/ScrollView;

    .line 59
    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    new-instance v1, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$b;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$b;-><init>(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public p1()V
    .locals 3

    .line 1
    sget v0, Ll/rcc0;->D0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/EditText;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->name:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    sget v0, Ll/rcc0;->j0:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/EditText;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->englishName:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    sget v0, Ll/rcc0;->w0:I

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Landroid/widget/EditText;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->sex:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    sget v0, Ll/rcc0;->E:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Landroid/widget/EditText;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 103
    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->birthDate:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    :cond_3
    sget v0, Ll/rcc0;->E0:I

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Landroid/widget/EditText;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 134
    .line 135
    if-eqz v0, :cond_4

    .line 136
    .line 137
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->idNumber:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 152
    .line 153
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    :cond_4
    sget v0, Ll/rcc0;->U:I

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Landroid/widget/EditText;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 165
    .line 166
    sget v0, Ll/rcc0;->L:I

    .line 167
    .line 168
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Landroid/widget/EditText;

    .line 173
    .line 174
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 175
    .line 176
    sget v0, Ll/rcc0;->s0:I

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Landroid/widget/EditText;

    .line 183
    .line 184
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 185
    .line 186
    sget v0, Ll/rcc0;->o0:I

    .line 187
    .line 188
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    check-cast v0, Landroid/widget/EditText;

    .line 193
    .line 194
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 195
    .line 196
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 197
    .line 198
    if-eqz v0, :cond_5

    .line 199
    .line 200
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 209
    .line 210
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 211
    .line 212
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->issueDate:Ljava/lang/String;

    .line 213
    .line 214
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 215
    .line 216
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    :cond_5
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 220
    .line 221
    if-eqz v0, :cond_6

    .line 222
    .line 223
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 232
    .line 233
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 234
    .line 235
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->expiryDate:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 238
    .line 239
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    .line 241
    .line 242
    :cond_6
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 243
    .line 244
    sget-object v1, Ll/cfm;->d:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-eqz v0, :cond_7

    .line 251
    .line 252
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 253
    .line 254
    if-eqz v0, :cond_8

    .line 255
    .line 256
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 265
    .line 266
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 267
    .line 268
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->placeOfIssue:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 271
    .line 272
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    .line 274
    .line 275
    goto :goto_0

    .line 276
    :cond_7
    sget v0, Ll/rcc0;->t0:I

    .line 277
    .line 278
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    check-cast v0, Landroid/widget/LinearLayout;

    .line 283
    .line 284
    const/16 v1, 0x8

    .line 285
    .line 286
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 290
    .line 291
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    sget v2, Lcom/idv/identity/base/R$string;->q0:I

    .line 296
    .line 297
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 302
    .line 303
    .line 304
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 305
    .line 306
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    sget v2, Lcom/idv/identity/base/R$string;->r0:I

    .line 311
    .line 312
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 317
    .line 318
    .line 319
    :cond_8
    :goto_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 320
    .line 321
    if-eqz v0, :cond_9

    .line 322
    .line 323
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 332
    .line 333
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 334
    .line 335
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->originOfIssue:Ljava/lang/String;

    .line 336
    .line 337
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->H:Landroid/widget/EditText;

    .line 338
    .line 339
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 340
    .line 341
    .line 342
    :cond_9
    sget v0, Ll/rcc0;->C0:I

    .line 343
    .line 344
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    check-cast v0, Landroid/widget/Button;

    .line 349
    .line 350
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->I:Landroid/widget/Button;

    .line 351
    .line 352
    new-instance v1, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$c;

    .line 353
    .line 354
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity$c;-><init>(Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    .line 359
    .line 360
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->d2()V

    .line 361
    .line 362
    .line 363
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;->e2()V

    .line 364
    .line 365
    .line 366
    return-void
.end method
