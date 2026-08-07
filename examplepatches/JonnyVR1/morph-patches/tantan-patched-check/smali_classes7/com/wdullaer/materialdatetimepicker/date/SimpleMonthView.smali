.class public Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;
.super Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/Canvas;IIIIIIIII)V
    .locals 0

    .line 1
    iget p7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 2
    .line 3
    if-ne p7, p4, :cond_0

    .line 4
    .line 5
    int-to-float p7, p5

    .line 6
    sget p8, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->Q:I

    .line 7
    .line 8
    div-int/lit8 p8, p8, 0x3

    .line 9
    .line 10
    sub-int p8, p6, p8

    .line 11
    .line 12
    int-to-float p8, p8

    .line 13
    sget p9, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->U:I

    .line 14
    .line 15
    int-to-float p9, p9

    .line 16
    iget-object p10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p1, p7, p8, p9, p10}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->l(III)Z

    .line 22
    .line 23
    .line 24
    move-result p7

    .line 25
    iget-object p8, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 p9, 0x1

    .line 28
    if-eqz p7, :cond_1

    .line 29
    .line 30
    sget-object p7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 31
    .line 32
    invoke-static {p7, p9}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object p7

    .line 36
    invoke-virtual {p8, p7}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget-object p7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 41
    .line 42
    const/4 p10, 0x0

    .line 43
    invoke-static {p7, p10}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 44
    .line 45
    .line 46
    move-result-object p7

    .line 47
    invoke-virtual {p8, p7}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 51
    .line 52
    invoke-interface {p7, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/a;->e0(III)Z

    .line 53
    .line 54
    .line 55
    move-result p7

    .line 56
    if-eqz p7, :cond_2

    .line 57
    .line 58
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 59
    .line 60
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->K:I

    .line 61
    .line 62
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    iget p7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 67
    .line 68
    if-ne p7, p4, :cond_3

    .line 69
    .line 70
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 71
    .line 72
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 73
    .line 74
    invoke-static {p3, p9}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 82
    .line 83
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->G:I

    .line 84
    .line 85
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    iget-boolean p7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->r:Z

    .line 90
    .line 91
    if-eqz p7, :cond_4

    .line 92
    .line 93
    iget p7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->t:I

    .line 94
    .line 95
    if-ne p7, p4, :cond_4

    .line 96
    .line 97
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 98
    .line 99
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->I:I

    .line 100
    .line 101
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_4
    iget-object p7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {p0, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->l(III)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_5

    .line 112
    .line 113
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->J:I

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_5
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->F:I

    .line 117
    .line 118
    :goto_1
    invoke-virtual {p7, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    .line 120
    .line 121
    :goto_2
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    const-string p3, "%d"

    .line 130
    .line 131
    invoke-static {p3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    int-to-float p3, p5

    .line 136
    int-to-float p4, p6

    .line 137
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 138
    .line 139
    invoke-virtual {p1, p2, p3, p4, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method
