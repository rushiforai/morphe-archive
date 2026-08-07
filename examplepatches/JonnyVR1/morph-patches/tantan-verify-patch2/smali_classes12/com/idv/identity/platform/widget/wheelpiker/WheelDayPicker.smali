.class public Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;
.super Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;
.source "SourceFile"


# static fields
.field private static final J0:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final E0:Ljava/util/Calendar;

.field private F0:I

.field private G0:I

.field private H0:I

.field public I0:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->J0:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->E0:Ljava/util/Calendar;

    .line 9
    .line 10
    const/4 p2, 0x5

    .line 11
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->I0:I

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->F0:I

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->G0:I

    .line 30
    .line 31
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->F0:I

    .line 32
    .line 33
    invoke-direct {p0, v1, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->p(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->H0:I

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->q()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private p(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->E0:Ljava/util/Calendar;

    .line 2
    .line 3
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->F0:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->E0:Ljava/util/Calendar;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    iget v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->G0:I

    .line 13
    .line 14
    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 15
    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    if-ne p2, v0, :cond_0

    .line 19
    .line 20
    iget p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->G0:I

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->m(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->I0:I

    .line 27
    .line 28
    sget-object p2, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->J0:Ljava/util/Map;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Ljava/util/List;

    .line 39
    .line 40
    if-nez p2, :cond_2

    .line 41
    .line 42
    new-instance p2, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    :goto_0
    if-gt v2, p1, :cond_1

    .line 48
    .line 49
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object v0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->J0:Ljava/util/Map;

    .line 60
    .line 61
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    :cond_2
    invoke-super {p0, p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setData(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private q()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->H0:I

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
.method public getCurrentDay()I
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

.method public getSelectedDay()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->H0:I

    .line 2
    .line 3
    return p0
.end method

.method public m(II)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_2

    .line 9
    .line 10
    const/4 p0, 0x5

    .line 11
    if-eq p1, p0, :cond_2

    .line 12
    .line 13
    const/16 p0, 0xa

    .line 14
    .line 15
    if-eq p1, p0, :cond_2

    .line 16
    .line 17
    const/16 p0, 0xc

    .line 18
    .line 19
    if-eq p1, p0, :cond_2

    .line 20
    .line 21
    const/4 p0, 0x7

    .line 22
    if-eq p1, p0, :cond_2

    .line 23
    .line 24
    const/16 p0, 0x8

    .line 25
    .line 26
    if-eq p1, p0, :cond_2

    .line 27
    .line 28
    const/16 p0, 0x1e

    .line 29
    .line 30
    return p0

    .line 31
    :cond_0
    rem-int/lit8 p0, p2, 0x4

    .line 32
    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    rem-int/lit16 p2, p2, 0x190

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    const/16 p0, 0x1d

    .line 40
    .line 41
    return p0

    .line 42
    :cond_1
    const/16 p0, 0x1c

    .line 43
    .line 44
    return p0

    .line 45
    :cond_2
    const/16 p0, 0x1f

    .line 46
    .line 47
    return p0
.end method

.method public n(II)V
    .locals 1

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->G0:I

    .line 4
    .line 5
    invoke-direct {p0, p2, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->p(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->F0:I

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->p(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "You can not invoke setData in WheelDayPicker"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public setSelectedDay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->H0:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDayPicker;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
