.class public Lv/text/CustomTypefaceSpan;
.super Landroid/text/style/TypefaceSpan;
.source "SourceFile"


# instance fields
.field private final color:I

.field private customStyle:I

.field private final newType:Landroid/graphics/Typeface;

.field private final size:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2, v0, v0}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Typeface;I)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, p2, p3, v0}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lv/text/CustomTypefaceSpan;->customStyle:I

    .line 6
    .line 7
    iput-object p2, p0, Lv/text/CustomTypefaceSpan;->newType:Landroid/graphics/Typeface;

    .line 8
    .line 9
    iput p3, p0, Lv/text/CustomTypefaceSpan;->color:I

    .line 10
    .line 11
    iput p4, p0, Lv/text/CustomTypefaceSpan;->size:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Paint;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Typeface;->getStyle()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :goto_0
    iget-object v1, p0, Lv/text/CustomTypefaceSpan;->newType:Landroid/graphics/Typeface;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/graphics/Typeface;->getStyle()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    not-int v1, v1

    .line 20
    and-int/2addr v0, v1

    .line 21
    iget v1, p0, Lv/text/CustomTypefaceSpan;->customStyle:I

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-ltz v1, :cond_1

    .line 25
    .line 26
    and-int/2addr v1, v2

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    and-int/lit8 v1, v0, 0x1

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_1
    iget v1, p0, Lv/text/CustomTypefaceSpan;->customStyle:I

    .line 41
    .line 42
    const/high16 v2, -0x41800000    # -0.25f

    .line 43
    .line 44
    if-ltz v1, :cond_3

    .line 45
    .line 46
    and-int/lit8 v1, v1, 0x2

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    and-int/lit8 v0, v0, 0x2

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 59
    .line 60
    .line 61
    :cond_4
    :goto_2
    iget-object v0, p0, Lv/text/CustomTypefaceSpan;->newType:Landroid/graphics/Typeface;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 64
    .line 65
    .line 66
    iget v0, p0, Lv/text/CustomTypefaceSpan;->color:I

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    .line 72
    .line 73
    :cond_5
    iget p0, p0, Lv/text/CustomTypefaceSpan;->size:I

    .line 74
    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    int-to-float p0, p0

    .line 78
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 79
    .line 80
    .line 81
    :cond_6
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/text/CustomTypefaceSpan;->customStyle:I

    .line 2
    .line 3
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/text/CustomTypefaceSpan;->a(Landroid/graphics/Paint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/text/CustomTypefaceSpan;->a(Landroid/graphics/Paint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
