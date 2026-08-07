.class public Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;
.super Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;
.source "SourceFile"


# instance fields
.field private A:Landroid/widget/TextView;

.field private B:Landroid/widget/TextView;

.field private C:Landroid/widget/TextView;

.field private D:Landroid/widget/TextView;

.field private z:Landroid/widget/TextView;


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
    sget v0, Ll/dec0;->i:I

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
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->z:Landroid/widget/TextView;

    .line 10
    .line 11
    sget v0, Ll/rcc0;->r0:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/TextView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->A:Landroid/widget/TextView;

    .line 20
    .line 21
    sget v0, Ll/rcc0;->w0:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/TextView;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->B:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v0, Ll/rcc0;->l0:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/widget/TextView;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->C:Landroid/widget/TextView;

    .line 40
    .line 41
    sget v0, Ll/rcc0;->D:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/widget/TextView;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->D:Landroid/widget/TextView;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->z:Landroid/widget/TextView;

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->idNumber:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->A:Landroid/widget/TextView;

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 85
    .line 86
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->B:Landroid/widget/TextView;

    .line 94
    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->sex:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->C:Landroid/widget/TextView;

    .line 115
    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 127
    .line 128
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->nationality:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    :cond_3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MalayIDCardResultActivity;->D:Landroid/widget/TextView;

    .line 136
    .line 137
    if-eqz p0, :cond_4

    .line 138
    .line 139
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->address:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    :cond_4
    return-void
.end method
