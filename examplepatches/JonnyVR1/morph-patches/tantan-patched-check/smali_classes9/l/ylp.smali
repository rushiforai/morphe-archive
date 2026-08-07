.class public Ll/ylp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ylp;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zlp;->a(Ll/ylp;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/rec0;->X:I

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
    invoke-virtual {p0, p1}, Ll/ylp;->b(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ylp;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ylp;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/ylp;->g:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ylp;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final e()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ylp;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/jbc0;->I0:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v0, Ll/jbc0;->z2:I

    .line 9
    .line 10
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/lc9;->i3()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Ll/ylp$a;->a:[I

    .line 19
    .line 20
    iget-object v3, p0, Ll/ylp;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    aget v2, v2, v3

    .line 27
    .line 28
    const-string v3, "#4D000000"

    .line 29
    .line 30
    const-string v4, "#000000"

    .line 31
    .line 32
    const/4 v5, 0x1

    .line 33
    const-string v6, ""

    .line 34
    .line 35
    const-string v7, "#FDE5AC"

    .line 36
    .line 37
    if-eq v2, v5, :cond_3

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    if-eq v2, v1, :cond_1

    .line 41
    .line 42
    const-string v3, "#EDD7A3"

    .line 43
    .line 44
    :goto_1
    move-object v4, v7

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    iget-object v0, p0, Ll/ylp;->e:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->h6:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    iget-boolean v0, p0, Ll/ylp;->g:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    sget v0, Ll/jbc0;->I0:I

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_2
    sget v0, Ll/jbc0;->B2:I

    .line 62
    .line 63
    const-string v4, "#F9E7FF"

    .line 64
    .line 65
    const-string v3, "#66F9E7FF"

    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_3
    const-string v0, "tttVipUpgradeToPremium"

    .line 69
    .line 70
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p0, Ll/ylp;->e:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->g6:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "VIP"

    .line 85
    .line 86
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    goto :goto_2

    .line 95
    :cond_4
    const-string v0, "tttSeeUpgradeToPremium"

    .line 96
    .line 97
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_5

    .line 102
    .line 103
    iget-object v0, p0, Ll/ylp;->e:Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->g6:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v1, p0, Ll/ylp;->e:Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->t7:I

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    :cond_5
    :goto_2
    iget-boolean v0, p0, Ll/ylp;->g:Z

    .line 128
    .line 129
    if-eqz v0, :cond_6

    .line 130
    .line 131
    sget v0, Ll/jbc0;->I0:I

    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_6
    sget v0, Ll/jbc0;->A2:I

    .line 135
    .line 136
    const-string v3, "#88EDD7A3"

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :goto_3
    iget-object v1, p0, Ll/ylp;->c:Lv/VText;

    .line 140
    .line 141
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/ylp;->d:Lv/VText;

    .line 149
    .line 150
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Ll/ylp;->d:Lv/VText;

    .line 158
    .line 159
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Ll/ylp;->b:Lv/VImage;

    .line 163
    .line 164
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Ll/ylp;->c:Lv/VText;

    .line 168
    .line 169
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public f(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ylp;->b:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/xlp;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/xlp;-><init>(Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
