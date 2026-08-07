.class public abstract Lcom/wdullaer/materialdatetimepicker/date/b;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"

# interfaces
.implements Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/b$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field protected final b:Lcom/wdullaer/materialdatetimepicker/date/a;

.field private c:Lcom/wdullaer/materialdatetimepicker/date/b$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/b;->c()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/date/a;->z2()Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/b;->f(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private d(II)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->c:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 2
    .line 3
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 8
    .line 9
    if-ne p0, p2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method


# virtual methods
.method public a(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Lcom/wdullaer/materialdatetimepicker/date/b$a;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/b;->e(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public abstract b(Landroid/content/Context;)Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.end method

.method public c()V
    .locals 3

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>(J)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->c:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 11
    .line 12
    return-void
.end method

.method public e(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/a;->w()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 7
    .line 8
    iget v1, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 9
    .line 10
    iget v2, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 11
    .line 12
    iget v3, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 13
    .line 14
    invoke-interface {v0, v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/date/a;->K0(III)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/b;->f(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public f(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->c:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/a;->c2()Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/wdullaer/materialdatetimepicker/date/a;->T3()Ljava/util/Calendar;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    mul-int/lit8 v2, v2, 0xc

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr v2, v0

    .line 26
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    mul-int/lit8 v0, v0, 0xc

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    add-int/2addr v0, p0

    .line 37
    sub-int/2addr v2, v0

    .line 38
    add-int/2addr v2, v1

    .line 39
    return v2
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const/4 p3, -0x1

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    check-cast p2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/util/HashMap;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->a:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/b;->b(Landroid/content/Context;)Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    .line 20
    .line 21
    invoke-direct {v0, p3, p3}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p2, v0}, Landroid/view/View;->setClickable(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setOnDayClickListener(Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;)V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    :goto_0
    if-nez v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 46
    .line 47
    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/a;->T3()Ljava/util/Calendar;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const/4 v2, 0x2

    .line 52
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    add-int/2addr v1, p1

    .line 57
    rem-int/lit8 v1, v1, 0xc

    .line 58
    .line 59
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 60
    .line 61
    invoke-interface {v3}, Lcom/wdullaer/materialdatetimepicker/date/a;->T3()Ljava/util/Calendar;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3, v2}, Ljava/util/Calendar;->get(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    add-int/2addr p1, v2

    .line 70
    div-int/lit8 p1, p1, 0xc

    .line 71
    .line 72
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 73
    .line 74
    invoke-interface {v2}, Lcom/wdullaer/materialdatetimepicker/date/a;->I3()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    add-int/2addr p1, v2

    .line 79
    invoke-direct {p0, p1, v1}, Lcom/wdullaer/materialdatetimepicker/date/b;->d(II)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->c:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 86
    .line 87
    iget p3, p3, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 88
    .line 89
    :cond_2
    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o()V

    .line 90
    .line 91
    .line 92
    const-string v2, "selected_day"

    .line 93
    .line 94
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {v0, v2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    const-string p3, "year"

    .line 102
    .line 103
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v0, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    const-string p1, "month"

    .line 111
    .line 112
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    invoke-virtual {v0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 120
    .line 121
    invoke-interface {p0}, Lcom/wdullaer/materialdatetimepicker/date/a;->L2()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string p1, "week_start"

    .line 130
    .line 131
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setMonthParams(Ljava/util/HashMap;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 138
    .line 139
    .line 140
    return-object p2
.end method

.method public hasStableIds()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
