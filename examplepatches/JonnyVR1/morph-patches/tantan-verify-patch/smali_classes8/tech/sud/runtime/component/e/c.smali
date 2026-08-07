.class Ltech/sud/runtime/component/e/c;
.super Landroid/widget/EditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/e/c$a;
    }
.end annotation


# instance fields
.field public a:Z

.field private b:Ljava/lang/String;

.field private c:Z

.field private final d:Ltech/sud/runtime/core/g;

.field private e:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltech/sud/runtime/core/g;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ltech/sud/runtime/component/e/c;->a:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/component/e/c;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean p1, p0, Ltech/sud/runtime/component/e/c;->c:Z

    .line 12
    .line 13
    new-instance v0, Ltech/sud/runtime/component/e/c$1;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/c$1;-><init>(Ltech/sud/runtime/component/e/c;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ltech/sud/runtime/component/e/c;->e:Landroid/text/TextWatcher;

    .line 19
    .line 20
    iput-object p2, p0, Ltech/sud/runtime/component/e/c;->d:Ltech/sud/runtime/core/g;

    .line 21
    .line 22
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    const/4 v0, -0x2

    .line 25
    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, p1, p1, p1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    const/high16 p1, 0x10000000

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    const/high16 p2, 0x3f800000    # 1.0f

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/c;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 163
    iput-object p1, p0, Ltech/sud/runtime/component/e/c;->b:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/c;)Z
    .locals 0

    .line 162
    iget-boolean p0, p0, Ltech/sud/runtime/component/e/c;->c:Z

    return p0
.end method

.method public static synthetic b(Ltech/sud/runtime/component/e/c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/c;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltech/sud/runtime/component/e/c;)Ltech/sud/runtime/core/g;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/c;->d:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 164
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltech/sud/runtime/component/e/c;->b:Ljava/lang/String;

    .line 165
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 166
    :cond_0
    iput-object p1, p0, Ltech/sud/runtime/component/e/c;->b:Ljava/lang/String;

    const/4 v0, 0x1

    .line 167
    iput-boolean v0, p0, Ltech/sud/runtime/component/e/c;->c:Z

    .line 168
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    .line 169
    iput-boolean p1, p0, Ltech/sud/runtime/component/e/c;->c:Z

    return-void
.end method

.method public a(Ljava/lang/String;Ltech/sud/runtime/component/e/c$a;)V
    .locals 4

    .line 1
    iget v0, p2, Ltech/sud/runtime/component/e/c$a;->c:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 5
    .line 6
    .line 7
    iget v0, p2, Ltech/sud/runtime/component/e/c$a;->g:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    .line 13
    .line 14
    iget v3, p2, Ltech/sud/runtime/component/e/c$a;->g:I

    .line 15
    .line 16
    invoke-direct {v0, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-array v3, v2, [Landroid/text/InputFilter;

    .line 20
    .line 21
    aput-object v0, v3, v1

    .line 22
    .line 23
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    new-array v0, v1, [Landroid/text/InputFilter;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    iget-boolean v0, p0, Ltech/sud/runtime/component/e/c;->a:Z

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iput-boolean v2, p0, Ltech/sud/runtime/component/e/c;->a:Z

    .line 47
    .line 48
    iget-object v0, p0, Ltech/sud/runtime/component/e/c;->e:Landroid/text/TextWatcher;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget v0, p2, Ltech/sud/runtime/component/e/c$a;->a:F

    .line 54
    .line 55
    float-to-int v0, v0

    .line 56
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setWidth(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ltech/sud/runtime/component/e/c;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-boolean v2, p0, Ltech/sud/runtime/component/e/c;->c:Z

    .line 63
    .line 64
    iget-boolean p1, p2, Ltech/sud/runtime/component/e/c$a;->e:Z

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 69
    .line 70
    .line 71
    const p1, 0x20001

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setInputType(I)V

    .line 75
    .line 76
    .line 77
    iget p1, p2, Ltech/sud/runtime/component/e/c$a;->b:F

    .line 78
    .line 79
    float-to-int p1, p1

    .line 80
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxHeight(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    const/4 p1, 0x6

    .line 85
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p2, Ltech/sud/runtime/component/e/c$a;->f:Ljava/lang/String;

    .line 89
    .line 90
    const-string v0, "password"

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    const/16 p1, 0x81

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    iget-object p1, p2, Ltech/sud/runtime/component/e/c$a;->f:Ljava/lang/String;

    .line 102
    .line 103
    const-string v0, "tel"

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_4

    .line 110
    .line 111
    const/16 p1, 0x3002

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    move p1, v2

    .line 115
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setInputType(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 119
    .line 120
    .line 121
    :goto_2
    iget p1, p2, Ltech/sud/runtime/component/e/c$a;->b:F

    .line 122
    .line 123
    float-to-int p1, p1

    .line 124
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHeight(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iget v0, p1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 136
    .line 137
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 138
    .line 139
    sub-float/2addr v0, p1

    .line 140
    iget p1, p2, Ltech/sud/runtime/component/e/c$a;->h:F

    .line 141
    .line 142
    cmpg-float v2, p1, v0

    .line 143
    .line 144
    if-gez v2, :cond_5

    .line 145
    .line 146
    const/4 p1, 0x0

    .line 147
    goto :goto_3

    .line 148
    :cond_5
    sub-float/2addr p1, v0

    .line 149
    :goto_3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 150
    .line 151
    invoke-virtual {p0, p1, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 152
    .line 153
    .line 154
    iget p1, p2, Ltech/sud/runtime/component/e/c$a;->d:I

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 157
    .line 158
    .line 159
    iput-boolean v1, p0, Ltech/sud/runtime/component/e/c;->c:Z

    .line 160
    .line 161
    return-void
.end method
