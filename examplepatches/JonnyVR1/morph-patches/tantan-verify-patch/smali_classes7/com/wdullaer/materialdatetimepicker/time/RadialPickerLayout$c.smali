.class Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)Z
    .locals 3

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->a(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->a(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-direct {v0, p1, v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v1, 0x1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-ne p1, v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->n()V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->m()V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;->a:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->b(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 p1, 0x0

    .line 72
    invoke-interface {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/a;->h(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    xor-int/2addr p0, v1

    .line 77
    return p0
.end method
