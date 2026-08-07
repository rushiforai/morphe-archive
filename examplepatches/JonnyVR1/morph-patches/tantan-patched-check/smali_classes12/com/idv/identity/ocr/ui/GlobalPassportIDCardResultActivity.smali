.class public Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;
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

.field private H:Landroid/widget/Button;

.field private I:Ll/xxb;

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

.method public static synthetic P1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->b2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->H:Landroid/widget/Button;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->e2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->c2()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->a2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Z1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$g;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$g;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 12
    .line 13
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$h;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$h;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 22
    .line 23
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$i;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$i;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private a2()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

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
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "^[A-Za-z]{1,50}$"

    .line 32
    .line 33
    invoke-static {v3, v0}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x1

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    sget v0, Lcom/idv/identity/base/R$string;->z0:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->X0(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    sget v6, Ll/yac0;->k:I

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    move v0, v3

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    sget v6, Ll/yac0;->j:I

    .line 70
    .line 71
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    move v0, v4

    .line 79
    :goto_0
    const-string v5, "^[A-Za-z\\s]{1,50}$"

    .line 80
    .line 81
    invoke-static {v5, v1}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_1

    .line 86
    .line 87
    sget v0, Lcom/idv/identity/base/R$string;->y0:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->X0(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    sget v5, Ll/yac0;->k:I

    .line 99
    .line 100
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 105
    .line 106
    .line 107
    move v0, v3

    .line 108
    goto :goto_1

    .line 109
    :cond_1
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    sget v6, Ll/yac0;->j:I

    .line 116
    .line 117
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-virtual {v1, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    :goto_1
    const-string v1, "^[A-Za-z0-9]{8,9}$"

    .line 125
    .line 126
    invoke-static {v1, v2}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_2

    .line 131
    .line 132
    sget v0, Lcom/idv/identity/base/R$string;->x0:I

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->X0(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    sget v2, Ll/yac0;->k:I

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 150
    .line 151
    .line 152
    move v0, v3

    .line 153
    goto :goto_2

    .line 154
    :cond_2
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    sget v5, Ll/yac0;->j:I

    .line 161
    .line 162
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 167
    .line 168
    .line 169
    :goto_2
    if-nez v0, :cond_4

    .line 170
    .line 171
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->H:Landroid/widget/Button;

    .line 172
    .line 173
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->H:Landroid/widget/Button;

    .line 177
    .line 178
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 183
    .line 184
    if-eqz v0, :cond_3

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    sget v2, Ll/y9c0;->e:I

    .line 191
    .line 192
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 197
    .line 198
    .line 199
    :cond_3
    invoke-virtual {p0, v3}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :cond_4
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->E1()V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->H:Landroid/widget/Button;

    .line 207
    .line 208
    invoke-virtual {v0, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->I1()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, v4}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->h1(Z)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method private b2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private c2()Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

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
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 42
    .line 43
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 52
    .line 53
    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 62
    .line 63
    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    iget-object v7, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 72
    .line 73
    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    new-instance v8, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$e;

    .line 82
    .line 83
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$e;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 87
    .line 88
    .line 89
    new-instance v8, Ljava/util/HashMap;

    .line 90
    .line 91
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v9, "surname"

    .line 95
    .line 96
    invoke-interface {v8, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    const-string v0, "givenname"

    .line 100
    .line 101
    invoke-interface {v8, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    const-string v0, "passportNo"

    .line 105
    .line 106
    invoke-interface {v8, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    const-string v0, "nationality"

    .line 110
    .line 111
    invoke-interface {v8, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    const-string v0, "sex"

    .line 115
    .line 116
    invoke-interface {v8, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    const-string v0, "birthDate"

    .line 120
    .line 121
    invoke-interface {v8, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    const-string v0, "countryCode"

    .line 125
    .line 126
    invoke-interface {v8, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    const-string v0, "expiryDate"

    .line 130
    .line 131
    invoke-interface {v8, v0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Ll/afm;->M()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v1}, Ll/afm;->i0()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v2}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    sget-object v3, Ll/cfm;->a:Ljava/lang/String;

    .line 159
    .line 160
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eqz v3, :cond_0

    .line 167
    .line 168
    sget-object v3, Ll/ffm;->g:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_0

    .line 175
    .line 176
    if-nez v0, :cond_1

    .line 177
    .line 178
    :cond_0
    sget-object v3, Ll/ffm;->e:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-eqz v3, :cond_2

    .line 185
    .line 186
    if-eqz v2, :cond_2

    .line 187
    .line 188
    :cond_1
    const-string v3, "nfcFileName"

    .line 189
    .line 190
    invoke-interface {v8, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->I:Ll/xxb;

    .line 194
    .line 195
    if-eqz v0, :cond_3

    .line 196
    .line 197
    invoke-virtual {v0}, Ll/xxb;->c()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_3

    .line 202
    .line 203
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->I:Ll/xxb;

    .line 204
    .line 205
    invoke-virtual {v0}, Ll/xxb;->b()[B

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-static {v0}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    const-string v3, "encryptKey"

    .line 214
    .line 215
    invoke-interface {v8, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    const-string v0, "encryptVersion"

    .line 219
    .line 220
    const-string v3, "NATIVE_E1"

    .line 221
    .line 222
    invoke-interface {v8, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    :cond_3
    sget-object v0, Ll/ffm;->e:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_5

    .line 232
    .line 233
    if-eqz v2, :cond_5

    .line 234
    .line 235
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    const-string v0, "android.hardware.nfc"

    .line 240
    .line 241
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-eqz p0, :cond_4

    .line 246
    .line 247
    const-string p0, "Y"

    .line 248
    .line 249
    goto :goto_0

    .line 250
    :cond_4
    const-string p0, "N"

    .line 251
    .line 252
    :goto_0
    const-string v0, "useNFC"

    .line 253
    .line 254
    invoke-interface {v8, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    :cond_5
    return-object v8
.end method

.method private e2()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->q:Lcom/idv/identity/platform/iOSLoadingView;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/afm;->d0()Lcom/idv/identity/platform/config/OSSConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v7

    .line 17
    const-string v1, "errMsg"

    .line 18
    .line 19
    const-string v2, "error"

    .line 20
    .line 21
    const-string v3, "status"

    .line 22
    .line 23
    if-eqz v7, :cond_3

    .line 24
    .line 25
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v4, :cond_3

    .line 28
    .line 29
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->OssEndPoint:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v4, :cond_3

    .line 32
    .line 33
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeyId:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz v4, :cond_3

    .line 36
    .line 37
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeySecret:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v4, :cond_0

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :cond_0
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Ll/hki;->f()V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Ll/afm;->Y()Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    invoke-static {v8}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    iget-object v5, v0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->I:Ll/xxb;

    .line 63
    .line 64
    if-eqz v5, :cond_1

    .line 65
    .line 66
    invoke-virtual {v5}, Ll/xxb;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    if-eqz v5, :cond_1

    .line 71
    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    iget-object v5, v0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->I:Ll/xxb;

    .line 75
    .line 76
    invoke-virtual {v5, v4}, Ll/xxb;->a([B)[B

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    :cond_1
    move-object v6, v4

    .line 81
    if-nez v6, :cond_2

    .line 82
    .line 83
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 88
    .line 89
    const-string v5, "nfcPictureContent is null."

    .line 90
    .line 91
    filled-new-array {v3, v2, v1, v5}, [Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const-string v2, "uploadNfcFileImage"

    .line 96
    .line 97
    invoke-virtual {v0, v4, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    iget-object v1, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 102
    .line 103
    const-string v2, "nfccard"

    .line 104
    .line 105
    const-string v3, "jpeg"

    .line 106
    .line 107
    invoke-static {v1, v2, v3}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    const/16 v3, 0xa

    .line 116
    .line 117
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual/range {v2 .. v7}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1, v5}, Ll/afm;->m1(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 134
    .line 135
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v14

    .line 143
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v16

    .line 151
    const-string v9, "status"

    .line 152
    .line 153
    const-string v10, "success"

    .line 154
    .line 155
    const-string v11, "ossFileName"

    .line 156
    .line 157
    const-string v13, "w"

    .line 158
    .line 159
    const-string v15, "h"

    .line 160
    .line 161
    move-object v12, v5

    .line 162
    filled-new-array/range {v9 .. v16}, [Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    const-string v4, "nfcOssUploadRes"

    .line 167
    .line 168
    invoke-virtual {v1, v2, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 172
    .line 173
    .line 174
    move-result-wide v1

    .line 175
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    new-instance v4, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;

    .line 180
    .line 181
    invoke-direct {v4, v0, v1, v2, v6}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;J[B)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3, v0, v4}, Ll/hki;->h(Landroid/content/Context;Ll/hki$d;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_3
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 193
    .line 194
    const-string v5, "ossConfig is null."

    .line 195
    .line 196
    filled-new-array {v3, v2, v1, v5}, [Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    const-string v2, "submitPhoto"

    .line 201
    .line 202
    invoke-virtual {v0, v4, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    return-void
.end method


# virtual methods
.method public H1()V
    .locals 3

    .line 1
    sget v0, Ll/dec0;->b:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/xxb;

    .line 7
    .line 8
    const-string v1, "identity-key-public.key"

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/ac00;->i(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-direct {v0, v1, v2}, Ll/xxb;-><init>(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->I:Ll/xxb;

    .line 19
    .line 20
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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->surname:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->givenname:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->passportNo:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->C:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->nationality:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->D:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->sex:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->birthDate:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->F:Landroid/widget/EditText;

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
    iput-object v1, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->countryCode:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    iput-object p0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->expiryDate:Ljava/lang/String;

    .line 192
    .line 193
    return-void
.end method

.method public d2()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->c2()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->r1(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f1()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->H:Landroid/widget/Button;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    sget v0, Ll/rcc0;->p:I

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/ScrollView;

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$b;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$b;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public p1()V
    .locals 2

    .line 1
    sget v0, Ll/rcc0;->y0:I

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 10
    .line 11
    sget v0, Ll/rcc0;->O:I

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 20
    .line 21
    sget v0, Ll/rcc0;->q0:I

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

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
    check-cast v0, Landroid/widget/EditText;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->C:Landroid/widget/EditText;

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 50
    .line 51
    sget v0, Ll/rcc0;->P:I

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 60
    .line 61
    sget v0, Ll/rcc0;->H:I

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
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 70
    .line 71
    sget v0, Ll/rcc0;->Q:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Landroid/widget/EditText;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z:Landroid/widget/EditText;

    .line 82
    .line 83
    if-eqz v0, :cond_0

    .line 84
    .line 85
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->surname:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->A:Landroid/widget/EditText;

    .line 103
    .line 104
    if-eqz v0, :cond_1

    .line 105
    .line 106
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 115
    .line 116
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->givenname:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->B:Landroid/widget/EditText;

    .line 124
    .line 125
    if-eqz v0, :cond_2

    .line 126
    .line 127
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->passportNo:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->C:Landroid/widget/EditText;

    .line 145
    .line 146
    if-eqz v0, :cond_3

    .line 147
    .line 148
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 157
    .line 158
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->nationality:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    :cond_3
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->D:Landroid/widget/EditText;

    .line 166
    .line 167
    if-eqz v0, :cond_4

    .line 168
    .line 169
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 178
    .line 179
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 180
    .line 181
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->sex:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    :cond_4
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 187
    .line 188
    if-eqz v0, :cond_5

    .line 189
    .line 190
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 199
    .line 200
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->birthDate:Ljava/lang/String;

    .line 203
    .line 204
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->E:Landroid/widget/EditText;

    .line 205
    .line 206
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    .line 208
    .line 209
    :cond_5
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->F:Landroid/widget/EditText;

    .line 210
    .line 211
    if-eqz v0, :cond_6

    .line 212
    .line 213
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v1}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 222
    .line 223
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 224
    .line 225
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->countryCode:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    .line 229
    .line 230
    :cond_6
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 231
    .line 232
    if-eqz v0, :cond_7

    .line 233
    .line 234
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v0, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 243
    .line 244
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 245
    .line 246
    iget-object v0, v0, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->expiryDate:Ljava/lang/String;

    .line 247
    .line 248
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->G:Landroid/widget/EditText;

    .line 249
    .line 250
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    .line 252
    .line 253
    :cond_7
    sget v0, Ll/rcc0;->C0:I

    .line 254
    .line 255
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    check-cast v0, Landroid/widget/Button;

    .line 260
    .line 261
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->H:Landroid/widget/Button;

    .line 262
    .line 263
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;

    .line 264
    .line 265
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    .line 270
    .line 271
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->Z1()V

    .line 272
    .line 273
    .line 274
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->a2()V

    .line 275
    .line 276
    .line 277
    iget-boolean v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->x:Z

    .line 278
    .line 279
    if-nez v0, :cond_8

    .line 280
    .line 281
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->b2()V

    .line 282
    .line 283
    .line 284
    :cond_8
    return-void
.end method

.method public z1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    new-instance v8, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$f;

    .line 12
    .line 13
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$f;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 14
    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const-string v7, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move-object v3, p1

    .line 21
    move-object v4, p2

    .line 22
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->J1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
