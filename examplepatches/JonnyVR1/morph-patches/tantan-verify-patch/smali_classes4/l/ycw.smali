.class public Ll/ycw;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Ll/l4g0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->g:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "p_explain_pop"

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/ycw;->f:Ll/l4g0;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic x(Ll/ycw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ycw;->y(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ycw;->f:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ycw;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ycw;->f:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/kec0;->A6:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget p1, Ll/adc0;->pe:I

    .line 18
    .line 19
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lv/AutoVDraweeView;

    .line 24
    .line 25
    const/high16 v0, 0x41c00000    # 24.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    neg-int v6, v1

    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    const/4 v3, 0x0

    .line 37
    const/4 v4, 0x0

    .line 38
    const/4 v5, 0x0

    .line 39
    invoke-static/range {v2 .. v7}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 40
    .line 41
    .line 42
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRSUDU0VEUyTFhVNVpXSExEMjdUTEFUQ0ZDUUxONjE0IiwidyI6NjQ4LCJoIjoyNjQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjowfQ.png"

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {p1, v0, v1}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    sget p1, Ll/adc0;->R1:I

    .line 49
    .line 50
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lv/AutoVDraweeView;

    .line 55
    .line 56
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRDVVVBMkhLVkM0UVM2UVBZVzM3WkxWRlZNTEpSSzE0IiwidyI6NzcxLCJoIjo4NzYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0NjE4NTI4MTcwMTQ0NDUyNjd9.png"

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    sget p1, Ll/adc0;->F1:I

    .line 62
    .line 63
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, Ll/xcw;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/xcw;-><init>(Ll/ycw;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    sget p1, Ll/adc0;->Td:I

    .line 76
    .line 77
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Landroid/widget/TextView;

    .line 82
    .line 83
    new-instance v0, Ljava/util/Date;

    .line 84
    .line 85
    iget-wide v3, p2, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 86
    .line 87
    double-to-long v3, v3

    .line 88
    invoke-direct {v0, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 89
    .line 90
    .line 91
    new-instance v3, Ljava/util/Date;

    .line 92
    .line 93
    iget-wide v4, p2, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 94
    .line 95
    double-to-long v4, v4

    .line 96
    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 97
    .line 98
    .line 99
    new-instance p2, Ll/m8c;

    .line 100
    .line 101
    const-string v4, "MM.dd"

    .line 102
    .line 103
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-direct {p2, v4, v5}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    new-instance v3, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v0, " - "

    .line 131
    .line 132
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string v3, "\uff08  "

    .line 145
    .line 146
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v3, "  \uff09"

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 162
    .line 163
    invoke-direct {v3, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    .line 167
    .line 168
    const-string v5, "#FE5F1D"

    .line 169
    .line 170
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    invoke-direct {v4, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    add-int/2addr p2, v0

    .line 186
    const/16 v5, 0x21

    .line 187
    .line 188
    invoke-virtual {v3, v4, v0, p2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 204
    .line 205
    .line 206
    sget p1, Lcom/google/android/material/R$id;->design_bottom_sheet:I

    .line 207
    .line 208
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    const/4 p1, 0x3

    .line 217
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 218
    .line 219
    .line 220
    return-void
.end method
