.class public Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;
.super Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;
.source "SourceFile"


# instance fields
.field private A:Landroid/widget/EditText;

.field private B:Landroid/widget/EditText;

.field private C:Landroid/widget/EditText;

.field private D:Landroid/widget/EditText;

.field private E:Landroid/widget/EditText;

.field private F:Landroid/widget/EditText;

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


# virtual methods
.method public H1()V
    .locals 1

    .line 1
    sget v0, Ll/dec0;->j:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a1()V
    .locals 0

    .line 1
    return-void
.end method

.method public f1()V
    .locals 0

    .line 1
    return-void
.end method

.method public j1()V
    .locals 0

    .line 1
    return-void
.end method

.method public p1()V
    .locals 2

    .line 1
    sget v0, Ll/rcc0;->R:I

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 10
    .line 11
    sget v0, Ll/rcc0;->n0:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/EditText;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 20
    .line 21
    sget v0, Ll/rcc0;->m0:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/EditText;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 30
    .line 31
    sget v0, Ll/rcc0;->i0:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/widget/EditText;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 40
    .line 41
    sget v0, Ll/rcc0;->w0:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/widget/EditText;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 50
    .line 51
    sget v0, Ll/rcc0;->E:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/widget/EditText;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 60
    .line 61
    sget v0, Ll/rcc0;->D:I

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/widget/EditText;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 70
    .line 71
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 72
    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->idNumber:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 93
    .line 94
    if-eqz v0, :cond_1

    .line 95
    .line 96
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 105
    .line 106
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->surname:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 114
    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->givenname:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 135
    .line 136
    if-eqz v0, :cond_3

    .line 137
    .line 138
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 147
    .line 148
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->middlename:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    :cond_3
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 156
    .line 157
    if-eqz v0, :cond_4

    .line 158
    .line 159
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 168
    .line 169
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 170
    .line 171
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->sex:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    :cond_4
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 177
    .line 178
    if-eqz v0, :cond_5

    .line 179
    .line 180
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 189
    .line 190
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 191
    .line 192
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->birthDate:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    .line 196
    .line 197
    :cond_5
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/PhilippinesIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 198
    .line 199
    if-eqz p0, :cond_6

    .line 200
    .line 201
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 212
    .line 213
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->address:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    :cond_6
    return-void
.end method
