.class public final Lzg6;
.super Landroid/app/DatePickerDialog;
.source "SourceFile"


# instance fields
.field public final a:Ls8b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ls8b;III)V
    .registers 6

    invoke-direct/range {p0 .. p5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    iput-object p2, p0, Lzg6;->a:Ls8b;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    const/4 p1, -0x1

    if-ne p2, p1, :cond_1d

    iget-object p1, p0, Lzg6;->a:Ls8b;

    if-eqz p1, :cond_1d

    invoke-virtual {p0}, Landroid/app/DatePickerDialog;->getDatePicker()Landroid/widget/DatePicker;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    invoke-virtual {p0}, Landroid/widget/DatePicker;->getYear()I

    move-result p2

    invoke-virtual {p0}, Landroid/widget/DatePicker;->getMonth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/DatePicker;->getDayOfMonth()I

    move-result v1

    invoke-virtual {p1, p0, p2, v0, v1}, Ls8b;->onDateSet(Landroid/widget/DatePicker;III)V

    :cond_1d
    return-void
.end method

.method public final setTitle(Ljava/lang/CharSequence;)V
    .registers 2

    const-string p1, ""

    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method
