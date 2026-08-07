.class Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 2
    .line 3
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;->b:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 2
    .line 3
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$a;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
