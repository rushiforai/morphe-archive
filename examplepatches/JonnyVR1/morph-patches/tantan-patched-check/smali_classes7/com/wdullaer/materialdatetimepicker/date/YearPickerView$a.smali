.class Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->g(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 2
    .line 3
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 2
    .line 3
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->a:I

    .line 4
    .line 5
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView$a;->c:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
