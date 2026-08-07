.class public Ll/hpf0;
.super Lcom/wdullaer/materialdatetimepicker/date/b;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/b;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;)Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    .locals 2

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/b;->b:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 5
    .line 6
    invoke-direct {v0, p1, v1, p0}, Lcom/wdullaer/materialdatetimepicker/date/SimpleMonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/a;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
