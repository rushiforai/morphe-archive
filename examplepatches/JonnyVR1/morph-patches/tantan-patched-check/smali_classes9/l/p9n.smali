.class public Ll/p9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grl;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VIcon;

.field public e:Lv/VText;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public final g:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p9n;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput p2, p0, Ll/p9n;->g:I

    .line 7
    .line 8
    return-void
.end method

.method private f(I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    const/high16 p0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 14
    .line 15
    .line 16
    int-to-float p0, p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private g()V
    .locals 5

    .line 1
    iget v0, p0, Ll/p9n;->g:I

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    if-eq v0, v1, :cond_5

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-eq v0, v1, :cond_5

    .line 12
    .line 13
    const/16 v1, 0x9

    .line 14
    .line 15
    if-eq v0, v1, :cond_5

    .line 16
    .line 17
    const/16 v1, 0x11

    .line 18
    .line 19
    if-eq v0, v1, :cond_5

    .line 20
    .line 21
    const/16 v1, 0x20

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_0
    const/4 v1, 0x1

    .line 28
    if-eq v0, v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/p9n;->f:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->R7:I

    .line 36
    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 40
    .line 41
    invoke-virtual {v2}, Ll/jan;->U3()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "#142bccff"

    .line 58
    .line 59
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const-string v2, "#2bccff"

    .line 64
    .line 65
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    sget v3, Ll/jbc0;->ca:I

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    const-string v0, "Unexpected value: "

    .line 73
    .line 74
    iget p0, p0, Ll/p9n;->g:I

    .line 75
    .line 76
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    iget-object v1, p0, Ll/p9n;->f:Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    const/16 v2, 0xe

    .line 83
    .line 84
    if-ne v0, v2, :cond_3

    .line 85
    .line 86
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->O7:I

    .line 87
    .line 88
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 91
    .line 92
    invoke-virtual {v2}, Ll/jan;->z3()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    goto :goto_0

    .line 109
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->O7:I

    .line 110
    .line 111
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 114
    .line 115
    invoke-virtual {v2}, Ll/jan;->s3()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    :goto_0
    const-string v1, "#14ff4798"

    .line 132
    .line 133
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    const-string v2, "#ff6298"

    .line 138
    .line 139
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    sget v3, Ll/jbc0;->X9:I

    .line 144
    .line 145
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-nez v4, :cond_4

    .line 150
    .line 151
    iget-object v4, p0, Ll/p9n;->d:Lv/VIcon;

    .line 152
    .line 153
    invoke-virtual {v4, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 154
    .line 155
    .line 156
    iget-object v3, p0, Ll/p9n;->e:Lv/VText;

    .line 157
    .line 158
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 159
    .line 160
    .line 161
    iget-object v2, p0, Ll/p9n;->e:Lv/VText;

    .line 162
    .line 163
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/p9n;->c:Landroid/widget/LinearLayout;

    .line 167
    .line 168
    invoke-direct {p0, v1}, Ll/p9n;->f(I)Landroid/graphics/drawable/Drawable;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_4
    const-string p0, "You should define coin purchase dialog desc style."

    .line 177
    .line 178
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_5
    :goto_2
    iget-object p0, p0, Ll/p9n;->c:Landroid/widget/LinearLayout;

    .line 183
    .line 184
    const/4 v0, 0x0

    .line 185
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 186
    .line 187
    .line 188
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/rec0;->K:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/p9n;->e(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/p9n;->a:Lv/VText;

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {p2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/p9n;->e:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p9n;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9n;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q9n;->a(Ll/p9n;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
