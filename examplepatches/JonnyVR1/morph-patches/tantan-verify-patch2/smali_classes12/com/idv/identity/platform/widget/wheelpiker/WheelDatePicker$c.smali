.class Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;
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
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

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
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

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
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

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
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 28
    .line 29
    invoke-static {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-le p1, p3, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    add-int/lit8 p1, p1, 0x1

    .line 46
    .line 47
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 48
    .line 49
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-lt p1, p2, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    add-int/lit8 p0, p0, -0x1

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->setSelectedMonth(I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 82
    .line 83
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-ne p1, p2, :cond_1

    .line 88
    .line 89
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 100
    .line 101
    invoke-static {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-lt p1, p2, :cond_1

    .line 106
    .line 107
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 108
    .line 109
    invoke-static {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 114
    .line 115
    invoke-static {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->setSelectedMonth(I)V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method
