.class public abstract Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;
.super Landroid/widget/ListView;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;
    }
.end annotation


# static fields
.field public static q:I = -0x1

.field private static r:Ljava/text/SimpleDateFormat;


# instance fields
.field protected a:I

.field protected b:Z

.field protected c:I

.field protected d:F

.field protected e:Landroid/content/Context;

.field protected f:Landroid/os/Handler;

.field protected g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

.field protected h:Lcom/wdullaer/materialdatetimepicker/date/b;

.field protected i:Lcom/wdullaer/materialdatetimepicker/date/b$a;

.field protected j:I

.field protected k:J

.field protected l:I

.field protected m:I

.field private n:Lcom/wdullaer/materialdatetimepicker/date/a;

.field private o:Z

.field protected p:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->r:Ljava/text/SimpleDateFormat;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 49
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x6

    .line 50
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->a:I

    const/4 p2, 0x0

    .line 51
    iput-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->b:Z

    const/4 v0, 0x7

    .line 52
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->c:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 53
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->d:F

    .line 54
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 55
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->i:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 56
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 57
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->m:I

    .line 58
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;

    invoke-direct {p2, p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;)V

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->p:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;

    .line 59
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->f(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->a:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->b:Z

    .line 9
    .line 10
    const/4 v1, 0x7

    .line 11
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->c:I

    .line 12
    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->d:F

    .line 16
    .line 17
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 23
    .line 24
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 25
    .line 26
    invoke-direct {v1}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->i:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 30
    .line 31
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 32
    .line 33
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->m:I

    .line 34
    .line 35
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->p:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->f(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setController(Lcom/wdullaer/materialdatetimepicker/date/a;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private c()Lcom/wdullaer/materialdatetimepicker/date/b$a;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    instance-of v3, v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    check-cast v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getAccessibilityFocus()Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method private static d(Lcom/wdullaer/materialdatetimepicker/date/b$a;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 6
    .line 7
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 8
    .line 9
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0}, Ljava/util/Calendar;->set(III)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v1, v2}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v1, " "

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    sget-object p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->r:Ljava/text/SimpleDateFormat;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method private j(Lcom/wdullaer/materialdatetimepicker/date/b$a;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    move v2, v0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    instance-of v4, v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 17
    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    check-cast v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 21
    .line 22
    invoke-virtual {v3, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n(Lcom/wdullaer/materialdatetimepicker/date/b$a;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    return v0
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/a;->z2()Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p0, v0, v1, v2, v2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->e(Lcom/wdullaer/materialdatetimepicker/date/b$a;ZZZ)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public abstract b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)Lcom/wdullaer/materialdatetimepicker/date/b;
.end method

.method public e(Lcom/wdullaer/materialdatetimepicker/date/b$a;ZZZ)Z
    .locals 7

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->i:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/a;->T3()Ljava/util/Calendar;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v2, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 25
    .line 26
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 27
    .line 28
    invoke-interface {v3}, Lcom/wdullaer/materialdatetimepicker/date/a;->I3()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sub-int/2addr v2, v3

    .line 33
    mul-int/lit8 v2, v2, 0xc

    .line 34
    .line 35
    iget p1, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 36
    .line 37
    add-int/2addr v2, p1

    .line 38
    sub-int/2addr v2, v0

    .line 39
    const/4 p1, 0x0

    .line 40
    move v0, p1

    .line 41
    :goto_0
    add-int/lit8 v3, v0, 0x1

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v4, 0x3

    .line 48
    const-string v5, "MonthFragment"

    .line 49
    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    invoke-static {v5, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 58
    .line 59
    .line 60
    if-ltz v6, :cond_8

    .line 61
    .line 62
    :goto_1
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/widget/AdapterView;->getPositionForView(Landroid/view/View;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    goto :goto_2

    .line 69
    :cond_2
    move v0, p1

    .line 70
    :goto_2
    if-eqz p3, :cond_3

    .line 71
    .line 72
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h:Lcom/wdullaer/materialdatetimepicker/date/b;

    .line 73
    .line 74
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 75
    .line 76
    invoke-virtual {v3, v6}, Lcom/wdullaer/materialdatetimepicker/date/b;->f(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    invoke-static {v5, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 80
    .line 81
    .line 82
    if-ne v2, v0, :cond_5

    .line 83
    .line 84
    if-eqz p4, :cond_4

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_4
    if-eqz p3, :cond_7

    .line 88
    .line 89
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 90
    .line 91
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setMonthDisplayed(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 92
    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_5
    :goto_3
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->i:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 96
    .line 97
    invoke-virtual {p0, p3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->setMonthDisplayed(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 98
    .line 99
    .line 100
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 101
    .line 102
    if-eqz p2, :cond_6

    .line 103
    .line 104
    sget p1, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->q:I

    .line 105
    .line 106
    const/16 p2, 0xfa

    .line 107
    .line 108
    invoke-virtual {p0, v2, p1, p2}, Landroid/widget/AbsListView;->smoothScrollToPositionFromTop(III)V

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x1

    .line 112
    return p0

    .line 113
    :cond_6
    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h(I)V

    .line 114
    .line 115
    .line 116
    :cond_7
    :goto_4
    return p1

    .line 117
    :cond_8
    move v0, v3

    .line 118
    goto :goto_0
.end method

.method public f(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->f:Landroid/os/Handler;

    .line 7
    .line 8
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-direct {v0, v1, v1}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->setDrawSelectorOnTop(Z)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->e:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->k()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getMostVisiblePosition()I
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    move v4, v3

    .line 12
    move v5, v4

    .line 13
    move v6, v5

    .line 14
    :goto_0
    if-ge v3, v1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    invoke-static {v7, v1}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    sub-int/2addr v8, v3

    .line 40
    if-le v8, v5, :cond_1

    .line 41
    .line 42
    move v6, v4

    .line 43
    move v5, v8

    .line 44
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    move v3, v7

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    :goto_1
    add-int/2addr v0, v6

    .line 49
    return v0
.end method

.method public h(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h:Lcom/wdullaer/materialdatetimepicker/date/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)Lcom/wdullaer/materialdatetimepicker/date/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h:Lcom/wdullaer/materialdatetimepicker/date/b;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g:Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/b;->f(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h:Lcom/wdullaer/materialdatetimepicker/date/b;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->setCacheColorHint(I)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->setFastScrollEnabled(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setFadingEdgeLength(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->d:F

    .line 30
    .line 31
    mul-float/2addr v0, v1

    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->setFriction(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public layoutChildren()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->c()Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-super {p0}, Landroid/widget/ListView;->layoutChildren()V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->o:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->o:Z

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->j(Lcom/wdullaer/materialdatetimepicker/date/b$a;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .param p1    # Landroid/view/accessibility/AccessibilityEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, -0x1

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setItemCount(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0
    .param p1    # Landroid/view/accessibility/AccessibilityNodeInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_BACKWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_FORWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    check-cast p2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    mul-int/2addr p1, p3

    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    sub-int/2addr p1, p2

    .line 25
    int-to-long p1, p1

    .line 26
    iput-wide p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->k:J

    .line 27
    .line 28
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->m:I

    .line 29
    .line 30
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->l:I

    .line 31
    .line 32
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->p:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$b;->a(Landroid/widget/AbsListView;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const/16 v0, 0x2000

    .line 2
    .line 3
    const/16 v1, 0x1000

    .line 4
    .line 5
    if-eq p1, v1, :cond_0

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 19
    .line 20
    invoke-interface {v2}, Lcom/wdullaer/materialdatetimepicker/date/a;->T3()Ljava/util/Calendar;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x2

    .line 25
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr p2, v2

    .line 30
    rem-int/lit8 v2, p2, 0xc

    .line 31
    .line 32
    const/16 v3, 0xc

    .line 33
    .line 34
    div-int/2addr p2, v3

    .line 35
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 36
    .line 37
    invoke-interface {v4}, Lcom/wdullaer/materialdatetimepicker/date/a;->I3()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    add-int/2addr p2, v4

    .line 42
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 43
    .line 44
    const/4 v5, 0x1

    .line 45
    invoke-direct {v4, p2, v2, v5}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>(III)V

    .line 46
    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    if-ne p1, v1, :cond_1

    .line 50
    .line 51
    iget p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 52
    .line 53
    add-int/2addr p1, v5

    .line 54
    iput p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 55
    .line 56
    if-ne p1, v3, :cond_2

    .line 57
    .line 58
    iput p2, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 59
    .line 60
    iget p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 61
    .line 62
    add-int/2addr p1, v5

    .line 63
    iput p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    if-ne p1, v0, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    const/4 v0, -0x1

    .line 79
    if-lt p1, v0, :cond_2

    .line 80
    .line 81
    iget p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 82
    .line 83
    sub-int/2addr p1, v5

    .line 84
    iput p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 85
    .line 86
    if-ne p1, v0, :cond_2

    .line 87
    .line 88
    const/16 p1, 0xb

    .line 89
    .line 90
    iput p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 91
    .line 92
    iget p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 93
    .line 94
    sub-int/2addr p1, v5

    .line 95
    iput p1, v4, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 96
    .line 97
    :cond_2
    :goto_0
    invoke-static {v4}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->d(Lcom/wdullaer/materialdatetimepicker/date/b$a;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {p0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v4, v5, p2, v5}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->e(Lcom/wdullaer/materialdatetimepicker/date/b$a;ZZZ)Z

    .line 105
    .line 106
    .line 107
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->o:Z

    .line 108
    .line 109
    return v5
.end method

.method public setController(Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->n:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/wdullaer/materialdatetimepicker/date/a;->L1(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->i()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setMonthDisplayed(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 2
    .line 3
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->j:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/AbsListView;->invalidateViews()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
