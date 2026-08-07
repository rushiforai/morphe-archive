.class final Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field final synthetic c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    if-gt p2, p3, :cond_0

    .line 7
    .line 8
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->a:I

    .line 9
    .line 10
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->b:I

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "minYear > maxYear"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->b:I

    .line 2
    .line 3
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->a:I

    .line 2
    .line 3
    add-int/2addr p0, p1

    .line 4
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    check-cast p2, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget v1, Ll/cfc0;->e:I

    .line 16
    .line 17
    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    .line 22
    .line 23
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 24
    .line 25
    invoke-static {p3}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->b(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;)Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-interface {p3}, Lcom/wdullaer/materialdatetimepicker/date/a;->u()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->b(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;)Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/a;->z()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {p2, p3, v1}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->d(IZ)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->a:I

    .line 47
    .line 48
    add-int/2addr p3, p1

    .line 49
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->b(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;)Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p1}, Lcom/wdullaer/materialdatetimepicker/date/a;->z2()Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget p1, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 60
    .line 61
    if-ne p1, p3, :cond_1

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    :cond_1
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, v0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->b(Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/view/View;->requestLayout()V

    .line 75
    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$b;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 80
    .line 81
    invoke-static {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->c(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;)Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;

    .line 82
    .line 83
    .line 84
    :cond_2
    return-object p2
.end method
