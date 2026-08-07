.class public Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;


# instance fields
.field private final a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

.field private final b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

.field private final c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field protected j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 85
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->j:Z

    .line 6
    .line 7
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, Ll/eec0;->c:I

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    sget p1, Ll/scc0;->C:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 25
    .line 26
    sget p2, Ll/scc0;->B:I

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 33
    .line 34
    iput-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 35
    .line 36
    sget v0, Ll/scc0;->A:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->i()V

    .line 56
    .line 57
    .line 58
    const-string v1, "00"

    .line 59
    .line 60
    invoke-virtual {p2, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setMaximumWidthText(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setMaximumWidthText(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getCurrentYear()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d:I

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e:I

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getCurrentDay()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f:I

    .line 83
    .line 84
    return-void
.end method

.method public static synthetic b(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    return-object p0
.end method

.method private i()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getData()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-ge v2, v3, :cond_0

    .line 32
    .line 33
    const-string v3, "0"

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setMaximumWidthText(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public a(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;Ljava/lang/Object;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    sget v0, Ll/scc0;->C:I

    .line 6
    .line 7
    if-ne p3, v0, :cond_0

    .line 8
    .line 9
    check-cast p2, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d:I

    .line 16
    .line 17
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 18
    .line 19
    iget-object p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 20
    .line 21
    invoke-virtual {p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    invoke-virtual {p2, p1, p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->o(II)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    sget p3, Ll/scc0;->B:I

    .line 34
    .line 35
    if-ne p1, p3, :cond_1

    .line 36
    .line 37
    check-cast p2, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e:I

    .line 44
    .line 45
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 46
    .line 47
    iget p3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d:I

    .line 48
    .line 49
    invoke-virtual {p2, p1, p3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->n(II)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getCurrentDay()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f:I

    .line 59
    .line 60
    return-void
.end method

.method public getCurrentDay()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getCurrentDay()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCurrentItemPosition()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "You can not get position of current item fromWheelDatePicker"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public getCurrentMonth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCurrentYear()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getCurrentYear()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getData()Ljava/util/List;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "You can not get data source from WheelDatePicker"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public getIndicatorSize()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getIndicatorSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getIndicatorSize()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getIndicatorSize()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getIndicatorSize()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getIndicatorSize()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const-string p0, "Can not get indicator size correctly from WheelDatePicker!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getItemSpace()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemSpace()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemSpace()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemSpace()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemSpace()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemSpace()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const-string p0, "Can not get item space correctly from WheelDatePicker!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getItemTextColor()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextColor()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextColor()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextColor()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextColor()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextColor()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const-string p0, "Can not get color of item text correctly fromWheelDatePicker!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getItemTextSize()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextSize()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextSize()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextSize()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getItemTextSize()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const-string p0, "Can not get size of item text correctly fromWheelDatePicker!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getSelectedDay()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->getSelectedDay()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSelectedItemTextColor()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getSelectedItemTextColor()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getSelectedItemTextColor()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getSelectedItemTextColor()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getSelectedItemTextColor()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getSelectedItemTextColor()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const-string p0, "Can not get color of selected item text correctly fromWheelDatePicker!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getSelectedMonth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getSelectedMonth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSelectedYear()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getSelectedYear()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getTypeface()Landroid/graphics/Typeface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getTypeface()Landroid/graphics/Typeface;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getTypeface()Landroid/graphics/Typeface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getTypeface()Landroid/graphics/Typeface;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getTypeface()Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    const-string p0, "Can not get typeface correctly from WheelDatePicker!"

    .line 45
    .line 46
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public getVisibleItemCount()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getVisibleItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getVisibleItemCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getVisibleItemCount()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getVisibleItemCount()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getVisibleItemCount()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const-string p0, "Can not get visible item count correctly fromWheelDatePicker!"

    .line 37
    .line 38
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public getYearEnd()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getYearEnd()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getYearStart()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getYearStart()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->g:I

    .line 15
    .line 16
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x2

    .line 21
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr v0, v1

    .line 26
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->h:I

    .line 27
    .line 28
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x5

    .line 33
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->i:I

    .line 38
    .line 39
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 40
    .line 41
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->g:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->setYearEnd(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->j()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    new-instance v1, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$a;-><init>(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 12
    .line 13
    new-instance v1, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$b;-><init>(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 22
    .line 23
    new-instance v1, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker$c;-><init>(Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setCurved(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setCurved(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setCurved(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setCurved(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setCyclic(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setCyclic(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setCyclic(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setCyclic(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setIndicator(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicator(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicator(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicator(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicatorColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicatorColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicatorColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setIndicatorSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicatorSize(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicatorSize(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setIndicatorSize(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setItemAlign(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "You don\'t need to set item align forWheelDatePicker"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public setItemSpace(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemSpace(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemSpace(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemSpace(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setItemTextColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemTextColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemTextColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemTextColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setItemTextSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemTextSize(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemTextSize(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setItemTextSize(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setMaximumWidthText(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setNeedCheckEndDate(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->j:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setSameWidth(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setSelectedDay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->f:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->setSelectedDay(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setSelectedItemPosition(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setSelectedItemTextColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setSelectedItemTextColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setSelectedItemTextColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setSelectedItemTextColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setSelectedMonth(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->e:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->setSelectedMonth(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->getCurrentYear()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {v0, p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->n(II)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setSelectedYear(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->d:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->setSelectedYear(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->getCurrentMonth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {v0, p1, p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->o(II)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setTypeface(Landroid/graphics/Typeface;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setVisibleItemCount(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setVisibleItemCount(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->b:Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setVisibleItemCount(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setVisibleItemCount(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setYearEnd(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->setYearEnd(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setYearStart(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->a:Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelYearPicker;->setYearStart(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
