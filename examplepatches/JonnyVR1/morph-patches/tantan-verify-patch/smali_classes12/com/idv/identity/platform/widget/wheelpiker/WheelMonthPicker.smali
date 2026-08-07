.class public Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;
.super Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;
.source "SourceFile"


# instance fields
.field private E0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    move v0, p2

    .line 11
    :goto_0
    const/16 v1, 0xc

    .line 12
    .line 13
    if-gt v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-super {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setData(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v0, 0x2

    .line 33
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    add-int/2addr p1, p2

    .line 38
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->E0:I

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->m()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private m()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->E0:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setSelectedItemPosition(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getCurrentMonth()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getData()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getCurrentItemPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public getSelectedMonth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->E0:I

    .line 2
    .line 3
    return p0
.end method

.method public setData(Ljava/util/List;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "You can not invoke setData in WheelMonthPicker"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public setSelectedMonth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->E0:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelMonthPicker;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
