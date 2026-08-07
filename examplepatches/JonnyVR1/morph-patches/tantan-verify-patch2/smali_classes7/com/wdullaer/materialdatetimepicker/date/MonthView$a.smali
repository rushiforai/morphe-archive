.class public Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;
.super Ll/dpf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/graphics/Rect;

.field private final b:Ljava/util/Calendar;

.field final synthetic c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/dpf;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->a:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->b:Ljava/util/Calendar;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(ILandroid/graphics/Rect;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 2
    .line 3
    iget v1, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 10
    .line 11
    iget v3, v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 12
    .line 13
    iget v4, v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 14
    .line 15
    iget v5, v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 16
    .line 17
    mul-int/lit8 v5, v5, 0x2

    .line 18
    .line 19
    sub-int/2addr v4, v5

    .line 20
    iget v5, v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 21
    .line 22
    div-int/2addr v4, v5

    .line 23
    add-int/lit8 p1, p1, -0x1

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr p1, v2

    .line 30
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 31
    .line 32
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 33
    .line 34
    div-int v2, p1, p0

    .line 35
    .line 36
    rem-int/2addr p1, p0

    .line 37
    mul-int/2addr p1, v4

    .line 38
    add-int/2addr v1, p1

    .line 39
    mul-int/2addr v2, v3

    .line 40
    add-int/2addr v0, v2

    .line 41
    add-int/2addr v4, v1

    .line 42
    add-int/2addr v3, v0

    .line 43
    invoke-virtual {p2, v1, v0, v4, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public b(I)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->b:Ljava/util/Calendar;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 4
    .line 5
    iget v2, v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 6
    .line 7
    iget v1, v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1, p1}, Ljava/util/Calendar;->set(III)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->b:Ljava/util/Calendar;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-string v2, "dd MMMM yyyy"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 25
    .line 26
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 27
    .line 28
    if-ne p1, v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->i:I

    .line 35
    .line 36
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_0
    return-object v0
.end method

.method public c(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/dpf;->getAccessibilityNodeProvider(Landroid/view/View;)Ll/cc;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/16 v0, 0x40

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Ll/cc;->f(IILandroid/os/Bundle;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getVirtualViewAt(FF)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h(FF)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ltz p0, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, -0x80000000

    .line 11
    .line 12
    return p0
.end method

.method public getVisibleVirtualViews(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 3
    .line 4
    iget v1, v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 5
    .line 6
    if-gt v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public onPerformActionForVirtualView(IILandroid/os/Bundle;)Z
    .locals 0

    .line 1
    const/16 p3, 0x10

    .line 2
    .line 3
    if-eq p2, p3, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a(Lcom/wdullaer/materialdatetimepicker/date/MonthView;I)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public onPopulateEventForVirtualView(ILandroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->b(I)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2, p0}, Landroid/view/accessibility/AccessibilityRecord;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onPopulateNodeForVirtualView(ILl/bc;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->a(ILandroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->b(I)Ljava/lang/CharSequence;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p2, v0}, Ll/bc;->s0(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->a:Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ll/bc;->j0(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x10

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ll/bc;->a(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 24
    .line 25
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 26
    .line 27
    if-ne p1, p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-virtual {p2, p0}, Ll/bc;->L0(Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
