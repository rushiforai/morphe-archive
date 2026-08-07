.class public Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field private a:I

.field final synthetic b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/widget/AbsListView;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->f:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->a:I

    .line 9
    .line 10
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->f:Landroid/os/Handler;

    .line 13
    .line 14
    const-wide/16 v0, 0x28

    .line 15
    .line 16
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 2
    .line 3
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->a:I

    .line 4
    .line 5
    iput v1, v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->m:I

    .line 6
    .line 7
    const-string v0, "MonthFragment"

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 17
    .line 18
    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 19
    .line 20
    :cond_0
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->a:I

    .line 21
    .line 22
    if-nez v0, :cond_6

    .line 23
    .line 24
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 25
    .line 26
    iget v2, v1, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 27
    .line 28
    if-eqz v2, :cond_6

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    if-eq v2, v3, :cond_6

    .line 32
    .line 33
    iput v0, v1, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    move v2, v0

    .line 41
    :goto_0
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-gtz v4, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 50
    .line 51
    add-int/2addr v2, v3

    .line 52
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    if-nez v1, :cond_2

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_2
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 67
    .line 68
    invoke-virtual {v4}, Landroid/widget/AdapterView;->getLastVisiblePosition()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v2, :cond_3

    .line 73
    .line 74
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/widget/AdapterView;->getCount()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    sub-int/2addr v2, v3

    .line 81
    if-eq v4, v2, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    move v3, v0

    .line 85
    :goto_1
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 94
    .line 95
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    div-int/lit8 v2, v2, 0x2

    .line 100
    .line 101
    if-eqz v3, :cond_5

    .line 102
    .line 103
    sget v3, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->q:I

    .line 104
    .line 105
    if-ge v0, v3, :cond_5

    .line 106
    .line 107
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 108
    .line 109
    const/16 v3, 0xfa

    .line 110
    .line 111
    if-le v1, v2, :cond_4

    .line 112
    .line 113
    invoke-virtual {p0, v0, v3}, Landroid/widget/AbsListView;->smoothScrollBy(II)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    invoke-virtual {p0, v1, v3}, Landroid/widget/AbsListView;->smoothScrollBy(II)V

    .line 118
    .line 119
    .line 120
    :cond_5
    :goto_2
    return-void

    .line 121
    :cond_6
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 122
    .line 123
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 124
    .line 125
    return-void
.end method
