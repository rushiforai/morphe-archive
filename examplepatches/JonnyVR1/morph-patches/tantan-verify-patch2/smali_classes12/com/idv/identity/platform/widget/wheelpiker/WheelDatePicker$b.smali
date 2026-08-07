.class Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;Ljava/lang/Object;I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->g(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getCurrentYear()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 12
    .line 13
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-lt p1, p3, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 30
    .line 31
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 36
    .line 37
    if-le p1, p3, :cond_0

    .line 38
    .line 39
    invoke-static {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->g(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 44
    .line 45
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    add-int/lit8 p3, p3, -0x1

    .line 50
    .line 51
    invoke-virtual {p1, p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->setSelectedYear(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    invoke-virtual {p1, p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->setSelectedMonth(I)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    invoke-static {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 81
    .line 82
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    if-ne p1, p3, :cond_1

    .line 87
    .line 88
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getCurrentDay()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 99
    .line 100
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    if-le p1, p3, :cond_1

    .line 105
    .line 106
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 107
    .line 108
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 113
    .line 114
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    invoke-virtual {p1, p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->setSelectedDay(I)V

    .line 119
    .line 120
    .line 121
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 122
    .line 123
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedMonth(I)V

    .line 132
    .line 133
    .line 134
    return-void
.end method
