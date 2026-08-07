.class Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->k(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->l(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->w()V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->B()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;->a:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/DialogFragment;->dismiss()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
