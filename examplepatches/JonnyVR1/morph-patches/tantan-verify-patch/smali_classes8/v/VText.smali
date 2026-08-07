.class public Lv/VText;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SourceFile"

# interfaces
.implements Ll/c7m;


# static fields
.field public static f:I = 0x1

.field public static g:I = 0x10

.field public static h:I = 0x1000


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lv/VText;->a:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lv/VText;->b:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lv/VText;->c:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {p0, p1, v1, v0}, Lv/VText;->h(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 16
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lv/VText;->a:I

    .line 18
    iput-boolean v0, p0, Lv/VText;->b:Z

    .line 19
    iput-boolean v0, p0, Lv/VText;->c:Z

    .line 20
    invoke-direct {p0, p1, p2, v0}, Lv/VText;->h(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lv/VText;->a:I

    .line 23
    iput-boolean v0, p0, Lv/VText;->b:Z

    .line 24
    iput-boolean v0, p0, Lv/VText;->c:Z

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lv/VText;->h(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private h(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/lyh0;->a(Landroid/widget/TextView;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2, p3}, Ll/oyh0;->b(Landroid/widget/TextView;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_4

    .line 12
    .line 13
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "th"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    if-eqz p2, :cond_4

    .line 34
    .line 35
    sget-object v0, Ll/hhc0;->i5:[I

    .line 36
    .line 37
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget p2, Ll/hhc0;->n5:I

    .line 42
    .line 43
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget p2, p0, Lv/VText;->a:I

    .line 50
    .line 51
    sget p3, Lv/VText;->f:I

    .line 52
    .line 53
    or-int/2addr p2, p3

    .line 54
    iput p2, p0, Lv/VText;->a:I

    .line 55
    .line 56
    :cond_1
    sget p2, Ll/hhc0;->o5:I

    .line 57
    .line 58
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    iget p2, p0, Lv/VText;->a:I

    .line 65
    .line 66
    sget p3, Lv/VText;->g:I

    .line 67
    .line 68
    or-int/2addr p2, p3

    .line 69
    iput p2, p0, Lv/VText;->a:I

    .line 70
    .line 71
    :cond_2
    sget p2, Ll/hhc0;->k5:I

    .line 72
    .line 73
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    iget p2, p0, Lv/VText;->a:I

    .line 80
    .line 81
    sget p3, Lv/VText;->h:I

    .line 82
    .line 83
    or-int/2addr p2, p3

    .line 84
    iput p2, p0, Lv/VText;->a:I

    .line 85
    .line 86
    :cond_3
    sget p2, Ll/hhc0;->l5:I

    .line 87
    .line 88
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    iput-boolean p2, p0, Lv/VText;->e:Z

    .line 93
    .line 94
    sget p2, Ll/hhc0;->m5:I

    .line 95
    .line 96
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    iput-boolean p2, p0, Lv/VText;->d:Z

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 103
    .line 104
    .line 105
    :cond_4
    return-void
.end method

.method private i()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget p0, p0, Lv/VText;->a:I

    .line 13
    .line 14
    sget v1, Lv/VText;->f:I

    .line 15
    .line 16
    and-int/2addr p0, v1

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 20
    .line 21
    invoke-direct {p0, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-class v1, Ll/fu0;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, [Ll/fu0;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    array-length v0, p0

    .line 40
    if-lez v0, :cond_1

    .line 41
    .line 42
    array-length v0, p0

    .line 43
    :goto_0
    if-ge v2, v0, :cond_1

    .line 44
    .line 45
    aget-object v1, p0, v2

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/fu0;->d()V

    .line 48
    .line 49
    .line 50
    add-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public f(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getTextView()Landroid/widget/TextView;
    .locals 0

    return-object p0
.end method

.method public final j()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget v1, p0, Lv/VText;->a:I

    .line 13
    .line 14
    sget v2, Lv/VText;->f:I

    .line 15
    .line 16
    and-int/2addr v1, v2

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-boolean p0, p0, Lv/VText;->d:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    invoke-direct {p0, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-class v1, Ll/fu0;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, [Ll/fu0;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    array-length v0, p0

    .line 44
    if-lez v0, :cond_1

    .line 45
    .line 46
    array-length v0, p0

    .line 47
    :goto_0
    if-ge v2, v0, :cond_1

    .line 48
    .line 49
    aget-object v1, p0, v2

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/fu0;->a()V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    :goto_1
    return-void
.end method

.method public k(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/VText;->j()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lv/VText;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAutoEmojiSize(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lv/VText;->a:I

    .line 4
    .line 5
    sget v0, Lv/VText;->h:I

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lv/VText;->a:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setEmojiEnable(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lv/VText;->a:I

    .line 4
    .line 5
    sget v0, Lv/VText;->f:I

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lv/VText;->a:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setLargeEmojiEnable(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lv/VText;->a:I

    .line 4
    .line 5
    sget v0, Lv/VText;->g:I

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lv/VText;->a:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setLargeEmojiForceDisabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VText;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 11

    .line 1
    iget v0, p0, Lv/VText;->a:I

    .line 2
    .line 3
    sget v1, Lv/VText;->f:I

    .line 4
    .line 5
    and-int/2addr v0, v1

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    if-eqz p1, :cond_5

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/16 v1, 0x5b

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x1

    .line 26
    if-ne v2, v1, :cond_0

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    move v1, v4

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v3

    .line 33
    :goto_0
    const/16 v2, 0x5d

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-ne v5, v0, :cond_1

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    sub-int/2addr v2, v4

    .line 50
    if-ne v0, v2, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v4, v3

    .line 54
    :goto_1
    iget-boolean v0, p0, Lv/VText;->e:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    const/4 v3, 0x2

    .line 59
    :cond_2
    move v8, v3

    .line 60
    invoke-direct {p0}, Lv/VText;->i()V

    .line 61
    .line 62
    .line 63
    iget v0, p0, Lv/VText;->a:I

    .line 64
    .line 65
    sget v2, Lv/VText;->h:I

    .line 66
    .line 67
    and-int/2addr v2, v0

    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    iget-boolean v10, p0, Lv/VText;->d:Z

    .line 79
    .line 80
    move-object v9, p0

    .line 81
    move-object v6, p1

    .line 82
    invoke-static/range {v5 .. v10}, Ll/oze;->g(Landroid/content/Context;Ljava/lang/CharSequence;FILl/c7m;Z)Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v9, p0, p2}, Lv/VText;->k(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    move-object v9, p0

    .line 91
    move-object v6, p1

    .line 92
    if-eqz v1, :cond_4

    .line 93
    .line 94
    if-eqz v4, :cond_4

    .line 95
    .line 96
    sget p0, Lv/VText;->g:I

    .line 97
    .line 98
    and-int/2addr p0, v0

    .line 99
    if-eqz p0, :cond_4

    .line 100
    .line 101
    iget-boolean p0, v9, Lv/VText;->b:Z

    .line 102
    .line 103
    if-nez p0, :cond_4

    .line 104
    .line 105
    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget-boolean p1, v9, Lv/VText;->d:Z

    .line 110
    .line 111
    invoke-static {p0, v6, v9, p1}, Ll/oze;->h(Landroid/content/Context;Ljava/lang/CharSequence;Ll/c7m;Z)Ljava/lang/CharSequence;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v9, p0, p2}, Lv/VText;->k(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_4
    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    iget-boolean p1, v9, Lv/VText;->d:Z

    .line 124
    .line 125
    invoke-static {p0, v6, v8, v9, p1}, Ll/oze;->f(Landroid/content/Context;Ljava/lang/CharSequence;ILl/c7m;Z)Ljava/lang/CharSequence;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v9, p0, p2}, Lv/VText;->k(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_5
    move-object v9, p0

    .line 134
    move-object v6, p1

    .line 135
    invoke-virtual {v9, v6, p2}, Lv/VText;->k(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/lyh0;->b(Landroid/widget/TextView;Landroid/content/Context;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setTextWithoutEmoticonify(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    sget-object v0, Landroid/widget/TextView$BufferType;->NORMAL:Landroid/widget/TextView$BufferType;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lv/VText;->k(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
