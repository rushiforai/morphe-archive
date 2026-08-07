.class Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;
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
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

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
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 16
    .line 17
    if-lt p1, p2, :cond_2

    .line 18
    .line 19
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 28
    .line 29
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 34
    .line 35
    if-le p1, p2, :cond_1

    .line 36
    .line 37
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getCurrentDay()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 46
    .line 47
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 52
    .line 53
    if-le p1, p2, :cond_0

    .line 54
    .line 55
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    add-int/lit8 p0, p0, -0x1

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->setSelectedMonth(I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 76
    .line 77
    invoke-static {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->setSelectedMonth(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 94
    .line 95
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-ne p1, p2, :cond_3

    .line 100
    .line 101
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getCurrentDay()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 112
    .line 113
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-le p1, p2, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 120
    .line 121
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 126
    .line 127
    invoke-static {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->setSelectedDay(I)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    const/4 p2, 0x2

    .line 144
    if-ne p1, p2, :cond_3

    .line 145
    .line 146
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 147
    .line 148
    invoke-virtual {p0, p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedMonth(I)V

    .line 149
    .line 150
    .line 151
    :cond_3
    return-void
.end method
