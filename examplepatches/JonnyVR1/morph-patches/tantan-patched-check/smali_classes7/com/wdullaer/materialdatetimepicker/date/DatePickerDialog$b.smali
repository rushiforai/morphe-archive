.class Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;->a:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;->a:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->w()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;->a:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;->a:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
