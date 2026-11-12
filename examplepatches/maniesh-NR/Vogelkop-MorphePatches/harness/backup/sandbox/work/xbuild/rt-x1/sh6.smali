.class public final Lsh6;
.super Landroid/app/AlertDialog;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/widget/DatePicker$OnDateChangedListener;
.implements Landroid/widget/TimePicker$OnTimeChangedListener;


# instance fields
.field public final a:Landroid/widget/DatePicker;

.field public final b:Landroid/widget/TimePicker;

.field public final c:Lt8b;

.field public final d:J

.field public final e:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lt8b;IIIIIZDD)V
    .registers 23

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    move-wide/from16 v1, p9

    double-to-long v6, v1

    iput-wide v6, p0, Lsh6;->d:J

    move-wide/from16 v1, p11

    double-to-long v8, v1

    iput-wide v8, p0, Lsh6;->e:J

    iput-object p2, p0, Lsh6;->c:Lt8b;

    const p2, 0x7f14054f

    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 v1, -0x1

    invoke-virtual {p0, v1, p2, p0}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    const/high16 p2, 0x1040000

    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    const/4 v1, -0x2

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p2, v2}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->setIcon(I)V

    const p2, 0x7f140551

    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    const-string p2, "layout_inflater"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    const p2, 0x7f0d00f1

    invoke-virtual {p1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    const p2, 0x7f0a02bf

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/widget/DatePicker;

    iput-object v1, p0, Lsh6;->a:Landroid/widget/DatePicker;

    move-object v2, p0

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v1 .. v9}, Lscd;->Z(Landroid/widget/DatePicker;Landroid/widget/DatePicker$OnDateChangedListener;IIIJJ)V

    const p2, 0x7f0a0b98

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TimePicker;

    iput-object p1, p0, Lsh6;->b:Landroid/widget/TimePicker;

    invoke-static/range {p8 .. p8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TimePicker;->setIs24HourView(Ljava/lang/Boolean;)V

    move/from16 p2, p6

    invoke-virtual {p1, p2}, Landroid/widget/TimePicker;->setHour(I)V

    move/from16 p2, p7

    invoke-virtual {p1, p2}, Landroid/widget/TimePicker;->setMinute(I)V

    invoke-virtual {p1, p0}, Landroid/widget/TimePicker;->setOnTimeChangedListener(Landroid/widget/TimePicker$OnTimeChangedListener;)V

    invoke-virtual {p1}, Landroid/widget/TimePicker;->getHour()I

    move-result p2

    invoke-virtual {p1}, Landroid/widget/TimePicker;->getMinute()I

    move-result p3

    invoke-virtual {p0, p1, p2, p3}, Lsh6;->onTimeChanged(Landroid/widget/TimePicker;II)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 13

    iget-object p1, p0, Lsh6;->c:Lt8b;

    if-eqz p1, :cond_2c

    iget-object p2, p0, Lsh6;->a:Landroid/widget/DatePicker;

    invoke-virtual {p2}, Landroid/view/View;->clearFocus()V

    iget-object p0, p0, Lsh6;->b:Landroid/widget/TimePicker;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    invoke-virtual {p2}, Landroid/widget/DatePicker;->getYear()I

    move-result v2

    invoke-virtual {p2}, Landroid/widget/DatePicker;->getMonth()I

    move-result v3

    invoke-virtual {p2}, Landroid/widget/DatePicker;->getDayOfMonth()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/TimePicker;->getHour()I

    move-result v5

    invoke-virtual {p0}, Landroid/widget/TimePicker;->getMinute()I

    move-result v6

    iget-object v0, p1, Lt8b;->b:Ltn;

    iget v1, p1, Lt8b;->a:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v9}, Ltn;->I(IIIIIIIII)V

    :cond_2c
    return-void
.end method

.method public final onDateChanged(Landroid/widget/DatePicker;III)V
    .registers 5

    iget-object p1, p0, Lsh6;->b:Landroid/widget/TimePicker;

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Landroid/widget/TimePicker;->getHour()I

    move-result p2

    invoke-virtual {p1}, Landroid/widget/TimePicker;->getMinute()I

    move-result p3

    invoke-virtual {p0, p1, p2, p3}, Lsh6;->onTimeChanged(Landroid/widget/TimePicker;II)V

    :cond_f
    return-void
.end method

.method public final onTimeChanged(Landroid/widget/TimePicker;II)V
    .registers 11

    iget-object p1, p0, Lsh6;->a:Landroid/widget/DatePicker;

    invoke-virtual {p1}, Landroid/widget/DatePicker;->getYear()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/DatePicker;->getMonth()I

    move-result v2

    invoke-virtual {p1}, Landroid/widget/DatePicker;->getDayOfMonth()I

    move-result v3

    new-instance v0, Ljava/util/GregorianCalendar;

    const-string p1, "UTC"

    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    iget-object p1, p0, Lsh6;->b:Landroid/widget/TimePicker;

    invoke-virtual {p1}, Landroid/widget/TimePicker;->getHour()I

    move-result v4

    invoke-virtual {p1}, Landroid/widget/TimePicker;->getMinute()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p2

    iget-wide v1, p0, Lsh6;->d:J

    cmp-long p2, p2, v1

    if-gez p2, :cond_38

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    goto :goto_45

    :cond_38
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p2

    iget-wide v1, p0, Lsh6;->e:J

    cmp-long p0, p2, v1

    if-lez p0, :cond_45

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    :cond_45
    :goto_45
    const/16 p0, 0xb

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TimePicker;->setHour(I)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TimePicker;->setMinute(I)V

    return-void
.end method
