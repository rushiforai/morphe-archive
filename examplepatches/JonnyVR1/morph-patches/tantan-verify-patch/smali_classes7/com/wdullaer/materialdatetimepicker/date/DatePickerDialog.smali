.class public Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
.super Landroidx/appcompat/app/AppCompatDialogFragment;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/wdullaer/materialdatetimepicker/date/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;,
        Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;,
        Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;
    }
.end annotation


# static fields
.field private static R0:Ljava/text/SimpleDateFormat;

.field private static S0:Ljava/text/SimpleDateFormat;

.field private static T0:Ljava/text/SimpleDateFormat;

.field private static U0:Ljava/text/SimpleDateFormat;


# instance fields
.field private A:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;

.field private B:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;",
            ">;"
        }
    .end annotation
.end field

.field private C:Landroid/content/DialogInterface$OnCancelListener;

.field private D:Landroid/content/DialogInterface$OnDismissListener;

.field private E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

.field private E0:I

.field protected F:Landroid/widget/TextView;

.field private F0:I

.field private G:Landroid/widget/LinearLayout;

.field private G0:Ljava/lang/String;

.field private H:Landroid/widget/TextView;

.field private H0:I

.field private I:Landroid/widget/TextView;

.field private I0:Ljava/lang/String;

.field private J:Landroid/widget/TextView;

.field private J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

.field private K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

.field private K0:Ll/yxk;

.field private L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

.field private L0:Z

.field private M:I

.field private M0:Ljava/lang/String;

.field private N:I

.field private N0:Ljava/lang/String;

.field private O:I

.field private O0:Ljava/lang/String;

.field private P:I

.field private P0:Ljava/lang/String;

.field private Q:Ljava/lang/String;

.field private Q0:Z

.field private R:Ljava/util/Calendar;

.field private S:Ljava/util/Calendar;

.field private T:[Ljava/util/Calendar;

.field private U:[Ljava/util/Calendar;

.field private V:[Ljava/util/Calendar;

.field private W:Z

.field private X:Z

.field protected Y:I

.field private Z:Z

.field private k0:Z

.field private p0:Z

.field private final z:Ljava/util/Calendar;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R0:Ljava/text/SimpleDateFormat;

    .line 13
    .line 14
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 15
    .line 16
    const-string v1, "MMM"

    .line 17
    .line 18
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S0:Ljava/text/SimpleDateFormat;

    .line 26
    .line 27
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 28
    .line 29
    const-string v1, "dd"

    .line 30
    .line 31
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->T0:Ljava/text/SimpleDateFormat;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatDialogFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->p4(Ljava/util/Calendar;)Ljava/util/Calendar;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 13
    .line 14
    new-instance v1, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->B:Ljava/util/HashSet;

    .line 20
    .line 21
    const/4 v1, -0x1

    .line 22
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->N:I

    .line 29
    .line 30
    const/16 v0, 0x76c

    .line 31
    .line 32
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O:I

    .line 33
    .line 34
    const/16 v0, 0x834

    .line 35
    .line 36
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P:I

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->X:Z

    .line 42
    .line 43
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Z:Z

    .line 47
    .line 48
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k0:Z

    .line 49
    .line 50
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->p0:Z

    .line 51
    .line 52
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E0:I

    .line 53
    .line 54
    sget v0, Lcom/wdullaer/materialdatetimepicker/R$string;->n:I

    .line 55
    .line 56
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F0:I

    .line 57
    .line 58
    sget v0, Lcom/wdullaer/materialdatetimepicker/R$string;->b:I

    .line 59
    .line 60
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->H0:I

    .line 61
    .line 62
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L0:Z

    .line 63
    .line 64
    return-void
.end method

.method private V3(Ljava/util/Calendar;)V
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-le v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, v0, v2}, Ljava/util/Calendar;->set(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->n4(Ljava/util/Calendar;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private X3([Ljava/util/Calendar;III)Z
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    array-length v0, p1

    .line 6
    move v1, p0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_7

    .line 8
    .line 9
    aget-object v2, p1, v1

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    if-ge p2, v4, :cond_1

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_1
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-le p2, v4, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    const/4 v4, 0x2

    .line 27
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-ge p3, v5, :cond_3

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_3
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-le p3, v4, :cond_4

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_4
    const/4 v4, 0x5

    .line 42
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-ge p4, v5, :cond_5

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_5
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-le p4, v2, :cond_6

    .line 54
    .line 55
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_6
    return v3

    .line 59
    :cond_7
    :goto_2
    return p0
.end method

.method private a4(III)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-le p1, v0, :cond_1

    .line 13
    .line 14
    return v2

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ge p1, v0, :cond_2

    .line 22
    .line 23
    return v1

    .line 24
    :cond_2
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-le p2, p1, :cond_3

    .line 32
    .line 33
    return v2

    .line 34
    :cond_3
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-ge p2, p1, :cond_4

    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 44
    .line 45
    const/4 p1, 0x5

    .line 46
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-le p3, p0, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    return v1
.end method

.method private b4(Ljava/util/Calendar;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x5

    .line 12
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-direct {p0, v0, v1, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->a4(III)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private c4(III)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ge p1, v0, :cond_1

    .line 13
    .line 14
    return v2

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-le p1, v0, :cond_2

    .line 22
    .line 23
    return v1

    .line 24
    :cond_2
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-ge p2, p1, :cond_3

    .line 32
    .line 33
    return v2

    .line 34
    :cond_3
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-le p2, p1, :cond_4

    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 44
    .line 45
    const/4 p1, 0x5

    .line 46
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-ge p3, p0, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    return v1
.end method

.method private d4(Ljava/util/Calendar;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x5

    .line 12
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-direct {p0, v0, v1, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->c4(III)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private e4(III)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->V:[Ljava/util/Calendar;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->X3([Ljava/util/Calendar;III)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->c4(III)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->a4(III)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method private f4(Ljava/util/Calendar;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x5

    .line 12
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-direct {p0, v0, v1, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->e4(III)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private g4(III)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->X3([Ljava/util/Calendar;III)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static h4(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;IIIZ)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;
    .locals 6

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;-><init>()V

    .line 4
    .line 5
    .line 6
    move-object v1, p0

    .line 7
    move v2, p1

    .line 8
    move v3, p2

    .line 9
    move v4, p3

    .line 10
    move v5, p4

    .line 11
    invoke-virtual/range {v0 .. v5}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Z3(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;IIIZ)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private k4(I)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-string v2, ": "

    .line 8
    .line 9
    const-wide/16 v3, 0x1f4

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    const/4 v6, 0x0

    .line 13
    if-eqz p1, :cond_5

    .line 14
    .line 15
    if-eq p1, v5, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 19
    .line 20
    sget-object v8, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 21
    .line 22
    if-ne v7, v8, :cond_3

    .line 23
    .line 24
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 25
    .line 26
    const v8, 0x3f59999a    # 0.85f

    .line 27
    .line 28
    .line 29
    const v9, 0x3f8ccccd    # 1.1f

    .line 30
    .line 31
    .line 32
    invoke-static {v7, v8, v9}, Ll/tnk0;->d(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L0:Z

    .line 37
    .line 38
    if-eqz v8, :cond_1

    .line 39
    .line 40
    invoke-virtual {v7, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 41
    .line 42
    .line 43
    iput-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L0:Z

    .line 44
    .line 45
    :cond_1
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 46
    .line 47
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->a()V

    .line 48
    .line 49
    .line 50
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 51
    .line 52
    if-eq v3, p1, :cond_2

    .line 53
    .line 54
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {v3, v6}, Landroid/view/View;->setSelected(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setSelected(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 65
    .line 66
    invoke-virtual {v3, v5}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 67
    .line 68
    .line 69
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 70
    .line 71
    :cond_2
    invoke-virtual {v7}, Landroid/animation/ObjectAnimator;->start()V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 76
    .line 77
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->a()V

    .line 78
    .line 79
    .line 80
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 81
    .line 82
    if-eq v3, p1, :cond_4

    .line 83
    .line 84
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 85
    .line 86
    invoke-virtual {v3, v6}, Landroid/view/View;->setSelected(Z)V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 90
    .line 91
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setSelected(Z)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 95
    .line 96
    invoke-virtual {v3, v5}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 97
    .line 98
    .line 99
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 100
    .line 101
    :cond_4
    :goto_0
    sget-object p1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R0:Ljava/text/SimpleDateFormat;

    .line 102
    .line 103
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p1, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 112
    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O0:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P0:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p1, p0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_5
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 145
    .line 146
    sget-object v8, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 147
    .line 148
    if-ne v7, v8, :cond_8

    .line 149
    .line 150
    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 151
    .line 152
    const v8, 0x3f666666    # 0.9f

    .line 153
    .line 154
    .line 155
    const v9, 0x3f866666    # 1.05f

    .line 156
    .line 157
    .line 158
    invoke-static {v7, v8, v9}, Ll/tnk0;->d(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L0:Z

    .line 163
    .line 164
    if-eqz v8, :cond_6

    .line 165
    .line 166
    invoke-virtual {v7, v3, v4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 167
    .line 168
    .line 169
    iput-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L0:Z

    .line 170
    .line 171
    :cond_6
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 172
    .line 173
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->a()V

    .line 174
    .line 175
    .line 176
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 177
    .line 178
    if-eq v3, p1, :cond_7

    .line 179
    .line 180
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 181
    .line 182
    invoke-virtual {v3, v5}, Landroid/view/View;->setSelected(Z)V

    .line 183
    .line 184
    .line 185
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 186
    .line 187
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSelected(Z)V

    .line 188
    .line 189
    .line 190
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 191
    .line 192
    invoke-virtual {v3, v6}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 193
    .line 194
    .line 195
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 196
    .line 197
    :cond_7
    invoke-virtual {v7}, Landroid/animation/ObjectAnimator;->start()V

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_8
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 202
    .line 203
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->a()V

    .line 204
    .line 205
    .line 206
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 207
    .line 208
    if-eq v3, p1, :cond_9

    .line 209
    .line 210
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 211
    .line 212
    invoke-virtual {v3, v5}, Landroid/view/View;->setSelected(Z)V

    .line 213
    .line 214
    .line 215
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 216
    .line 217
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSelected(Z)V

    .line 218
    .line 219
    .line 220
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 221
    .line 222
    invoke-virtual {v3, v6}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 223
    .line 224
    .line 225
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 226
    .line 227
    :cond_9
    :goto_1
    const/16 p1, 0x10

    .line 228
    .line 229
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    invoke-static {v3, v0, v1, p1}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 238
    .line 239
    new-instance v1, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M0:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 260
    .line 261
    .line 262
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 263
    .line 264
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->N0:Ljava/lang/String;

    .line 265
    .line 266
    invoke-static {p1, p0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method private n4(Ljava/util/Calendar;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    const-wide v2, 0x7fffffffffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    move-object v5, p1

    .line 13
    :goto_0
    if-ge v4, v1, :cond_0

    .line 14
    .line 15
    aget-object v6, v0, v4

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v7

    .line 21
    invoke-virtual {v6}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v9

    .line 25
    sub-long/2addr v7, v9

    .line 26
    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v7

    .line 30
    cmp-long v2, v7, v2

    .line 31
    .line 32
    if-gez v2, :cond_0

    .line 33
    .line 34
    invoke-direct {p0, v6}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->f4(Ljava/util/Calendar;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    add-int/lit8 v4, v4, 0x1

    .line 41
    .line 42
    move-object v5, v6

    .line 43
    move-wide v2, v7

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->V:[Ljava/util/Calendar;

    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/util/Calendar;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ljava/util/Calendar;

    .line 68
    .line 69
    :goto_1
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->f4(Ljava/util/Calendar;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->f4(Ljava/util/Calendar;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    const/4 v2, 0x5

    .line 82
    const/4 v3, 0x1

    .line 83
    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 84
    .line 85
    .line 86
    const/4 v3, -0x1

    .line 87
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->f4(Ljava/util/Calendar;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_3

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->f4(Ljava/util/Calendar;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_4

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_4
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->d4(Ljava/util/Calendar;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 128
    .line 129
    .line 130
    move-result-wide v0

    .line 131
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_5
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->b4(Ljava/util/Calendar;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 144
    .line 145
    .line 146
    move-result-wide v0

    .line 147
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 148
    .line 149
    .line 150
    :cond_6
    return-void
.end method

.method private p4(Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 1

    .line 1
    const/16 p0, 0xb

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 5
    .line 6
    .line 7
    const/16 p0, 0xc

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 10
    .line 11
    .line 12
    const/16 p0, 0xd

    .line 13
    .line 14
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0xe

    .line 18
    .line 19
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method private q4(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 2
    .line 3
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R0:Ljava/text/SimpleDateFormat;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 19
    .line 20
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 21
    .line 22
    if-ne v0, v1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F:Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y3(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const/4 v4, 0x7

    .line 48
    invoke-virtual {v1, v4, v2, v3}, Ljava/util/Calendar;->getDisplayName(IILjava/util/Locale;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->H:Landroid/widget/TextView;

    .line 64
    .line 65
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S0:Ljava/text/SimpleDateFormat;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I:Landroid/widget/TextView;

    .line 81
    .line 82
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->T0:Ljava/text/SimpleDateFormat;

    .line 83
    .line 84
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 98
    .line 99
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;->VERSION_2:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 100
    .line 101
    if-ne v0, v1, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I:Landroid/widget/TextView;

    .line 104
    .line 105
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U0:Ljava/text/SimpleDateFormat;

    .line 106
    .line 107
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F:Landroid/widget/TextView;

    .line 123
    .line 124
    if-eqz v0, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y3(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_3
    const/16 v0, 0x8

    .line 135
    .line 136
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 142
    .line 143
    .line 144
    move-result-wide v0

    .line 145
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 146
    .line 147
    invoke-virtual {v2, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDateMillis(J)V

    .line 148
    .line 149
    .line 150
    const/16 v2, 0x18

    .line 151
    .line 152
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-static {v3, v0, v1, v2}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    invoke-virtual {v3, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    if-eqz p1, :cond_5

    .line 166
    .line 167
    const/16 p1, 0x14

    .line 168
    .line 169
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-static {v2, v0, v1, p1}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 178
    .line 179
    invoke-static {p0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    :cond_5
    return-void
.end method

.method private r4()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->B:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;->a()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public D3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->V3(Ljava/util/Calendar;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->r4()V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k4(I)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->q4(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public I3()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    aget-object p0, v0, p0

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O:I

    .line 23
    .line 24
    if-le v0, v2, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O:I

    .line 34
    .line 35
    return p0
.end method

.method public K0(III)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p1, v0, p2}, Ljava/util/Calendar;->set(II)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 14
    .line 15
    const/4 p2, 0x5

    .line 16
    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->set(II)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->r4()V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->q4(Z)V

    .line 23
    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->p0:Z

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->i4()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public L1(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->B:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L2()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->N:I

    .line 2
    .line 3
    return p0
.end method

.method public T3()Ljava/util/Calendar;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    aget-object p0, v0, v1

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O:I

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2, p0}, Ljava/util/Calendar;->set(II)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x5

    .line 25
    invoke-virtual {v0, p0, v2}, Ljava/util/Calendar;->set(II)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x2

    .line 29
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public W3()V
    .locals 0

    .line 1
    return-void
.end method

.method public Y3(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Z3(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;IIIZ)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->A:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0, p2}, Ljava/util/Calendar;->set(II)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 10
    .line 11
    const/4 p2, 0x2

    .line 12
    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->set(II)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 16
    .line 17
    const/4 p2, 0x5

    .line 18
    invoke-virtual {p1, p2, p4}, Ljava/util/Calendar;->set(II)V

    .line 19
    .line 20
    .line 21
    sget-object p1, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;->VERSION_2:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 24
    .line 25
    iput-boolean p5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q0:Z

    .line 26
    .line 27
    return-void
.end method

.method public c2()Ljava/util/Calendar;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    array-length p0, v0

    .line 7
    sub-int/2addr p0, v1

    .line 8
    aget-object p0, v0, p0

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P:I

    .line 21
    .line 22
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->set(II)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    const/16 v1, 0x1f

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x2

    .line 32
    const/16 v1, 0xb

    .line 33
    .line 34
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public e0(III)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->e4(III)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->g4(III)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public i4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->A:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 20
    .line 21
    const/4 v4, 0x5

    .line 22
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-interface {v0, p0, v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;->a(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public j4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public k1()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    array-length p0, v0

    .line 7
    sub-int/2addr p0, v1

    .line 8
    aget-object p0, v0, p0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P:I

    .line 24
    .line 25
    if-ge v0, v2, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P:I

    .line 35
    .line 36
    return p0
.end method

.method public l4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public m4([Ljava/util/Calendar;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    aget-object v2, p1, v1

    .line 9
    .line 10
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->p4(Ljava/util/Calendar;)Ljava/util/Calendar;

    .line 11
    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->g()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public n3()[Ljava/util/Calendar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->T:[Ljava/util/Calendar;

    .line 2
    .line 3
    return-object p0
.end method

.method public o4(Z)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E0:I

    .line 2
    .line 3
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->C:Landroid/content/DialogInterface$OnCancelListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->w()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sget v1, Ll/qdc0;->j:I

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k4(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sget v0, Ll/qdc0;->i:I

    .line 22
    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k4(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViewsInLayout()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string v0, "show_on_recreate"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q0:Z

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroidx/fragment/app/DialogFragment;->setShowsDialog(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 30
    .line 31
    .line 32
    const/4 v0, -0x1

    .line 33
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 38
    .line 39
    const-string v1, "year"

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 50
    .line 51
    const-string v1, "month"

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/4 v2, 0x2

    .line 58
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 62
    .line 63
    const-string v1, "day"

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v2, 0x5

    .line 70
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 71
    .line 72
    .line 73
    const-string v0, "default_view"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E0:I

    .line 80
    .line 81
    :cond_1
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 82
    .line 83
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v0, "EEEMMMdd"

    .line 88
    .line 89
    invoke-static {p1, v0}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-direct {p0, p1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 98
    .line 99
    .line 100
    sput-object p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U0:Ljava/text/SimpleDateFormat;

    .line 101
    .line 102
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/nu0;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Ll/nu0;->supportRequestWindowFeature(I)Z

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 10

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E0:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const-string v0, "week_start"

    .line 8
    .line 9
    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->N:I

    .line 14
    .line 15
    const-string v0, "year_start"

    .line 16
    .line 17
    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O:I

    .line 22
    .line 23
    const-string v0, "year_end"

    .line 24
    .line 25
    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P:I

    .line 30
    .line 31
    const-string v0, "current_view"

    .line 32
    .line 33
    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const-string v3, "list_position"

    .line 38
    .line 39
    invoke-virtual {p3, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const-string v4, "list_position_offset"

    .line 44
    .line 45
    invoke-virtual {p3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const-string v5, "min_date"

    .line 50
    .line 51
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Ljava/util/Calendar;

    .line 56
    .line 57
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 58
    .line 59
    const-string v5, "max_date"

    .line 60
    .line 61
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    check-cast v5, Ljava/util/Calendar;

    .line 66
    .line 67
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 68
    .line 69
    const-string v5, "highlighted_days"

    .line 70
    .line 71
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, [Ljava/util/Calendar;

    .line 76
    .line 77
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->T:[Ljava/util/Calendar;

    .line 78
    .line 79
    const-string v5, "selectable_days"

    .line 80
    .line 81
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    check-cast v5, [Ljava/util/Calendar;

    .line 86
    .line 87
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 88
    .line 89
    const-string v5, "disabled_days"

    .line 90
    .line 91
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    check-cast v5, [Ljava/util/Calendar;

    .line 96
    .line 97
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->V:[Ljava/util/Calendar;

    .line 98
    .line 99
    const-string v5, "theme_dark"

    .line 100
    .line 101
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 106
    .line 107
    const-string v5, "theme_dark_changed"

    .line 108
    .line 109
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->X:Z

    .line 114
    .line 115
    const-string v5, "accent"

    .line 116
    .line 117
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    iput v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 122
    .line 123
    const-string v5, "vibrate"

    .line 124
    .line 125
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Z:Z

    .line 130
    .line 131
    const-string v5, "dismiss"

    .line 132
    .line 133
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k0:Z

    .line 138
    .line 139
    const-string v5, "auto_dismiss"

    .line 140
    .line 141
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->p0:Z

    .line 146
    .line 147
    const-string v5, "title"

    .line 148
    .line 149
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q:Ljava/lang/String;

    .line 154
    .line 155
    const-string v5, "ok_resid"

    .line 156
    .line 157
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    iput v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F0:I

    .line 162
    .line 163
    const-string v5, "ok_string"

    .line 164
    .line 165
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G0:Ljava/lang/String;

    .line 170
    .line 171
    const-string v5, "cancel_resid"

    .line 172
    .line 173
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    iput v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->H0:I

    .line 178
    .line 179
    const-string v5, "cancel_string"

    .line 180
    .line 181
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I0:Ljava/lang/String;

    .line 186
    .line 187
    const-string v5, "version"

    .line 188
    .line 189
    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    check-cast p3, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 194
    .line 195
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_0
    move v3, v1

    .line 199
    move v4, v2

    .line 200
    :goto_0
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 201
    .line 202
    sget-object v5, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 203
    .line 204
    if-ne p3, v5, :cond_1

    .line 205
    .line 206
    sget p3, Ll/cfc0;->a:I

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_1
    sget p3, Ll/cfc0;->b:I

    .line 210
    .line 211
    :goto_1
    invoke-virtual {p1, p3, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 216
    .line 217
    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->n4(Ljava/util/Calendar;)V

    .line 218
    .line 219
    .line 220
    sget p2, Ll/qdc0;->g:I

    .line 221
    .line 222
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    check-cast p2, Landroid/widget/TextView;

    .line 227
    .line 228
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F:Landroid/widget/TextView;

    .line 229
    .line 230
    sget p2, Ll/qdc0;->i:I

    .line 231
    .line 232
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    check-cast p2, Landroid/widget/LinearLayout;

    .line 237
    .line 238
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G:Landroid/widget/LinearLayout;

    .line 239
    .line 240
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 241
    .line 242
    .line 243
    sget p2, Ll/qdc0;->h:I

    .line 244
    .line 245
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    check-cast p2, Landroid/widget/TextView;

    .line 250
    .line 251
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->H:Landroid/widget/TextView;

    .line 252
    .line 253
    sget p2, Ll/qdc0;->f:I

    .line 254
    .line 255
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    check-cast p2, Landroid/widget/TextView;

    .line 260
    .line 261
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I:Landroid/widget/TextView;

    .line 262
    .line 263
    sget p2, Ll/qdc0;->j:I

    .line 264
    .line 265
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object p2

    .line 269
    check-cast p2, Landroid/widget/TextView;

    .line 270
    .line 271
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J:Landroid/widget/TextView;

    .line 272
    .line 273
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 277
    .line 278
    .line 279
    move-result-object p2

    .line 280
    new-instance p3, Lcom/wdullaer/materialdatetimepicker/date/SimpleDayPickerView;

    .line 281
    .line 282
    invoke-direct {p3, p2, p0}, Lcom/wdullaer/materialdatetimepicker/date/SimpleDayPickerView;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)V

    .line 283
    .line 284
    .line 285
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 286
    .line 287
    new-instance p3, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 288
    .line 289
    invoke-direct {p3, p2, p0}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;-><init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/a;)V

    .line 290
    .line 291
    .line 292
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 293
    .line 294
    iget-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->X:Z

    .line 295
    .line 296
    if-nez p3, :cond_2

    .line 297
    .line 298
    iget-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 299
    .line 300
    invoke-static {p2, p3}, Ll/tnk0;->e(Landroid/content/Context;Z)Z

    .line 301
    .line 302
    .line 303
    move-result p3

    .line 304
    iput-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 305
    .line 306
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 307
    .line 308
    .line 309
    move-result-object p3

    .line 310
    sget v5, Lcom/wdullaer/materialdatetimepicker/R$string;->f:I

    .line 311
    .line 312
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v5

    .line 316
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M0:Ljava/lang/String;

    .line 317
    .line 318
    sget v5, Lcom/wdullaer/materialdatetimepicker/R$string;->r:I

    .line 319
    .line 320
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v5

    .line 324
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->N0:Ljava/lang/String;

    .line 325
    .line 326
    sget v5, Lcom/wdullaer/materialdatetimepicker/R$string;->B:I

    .line 327
    .line 328
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v5

    .line 332
    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O0:Ljava/lang/String;

    .line 333
    .line 334
    sget v5, Lcom/wdullaer/materialdatetimepicker/R$string;->v:I

    .line 335
    .line 336
    invoke-virtual {p3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p3

    .line 340
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P0:Ljava/lang/String;

    .line 341
    .line 342
    iget-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 343
    .line 344
    if-eqz p3, :cond_3

    .line 345
    .line 346
    sget p3, Ll/q9c0;->q:I

    .line 347
    .line 348
    goto :goto_2

    .line 349
    :cond_3
    sget p3, Ll/q9c0;->p:I

    .line 350
    .line 351
    :goto_2
    invoke-static {p2, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 352
    .line 353
    .line 354
    move-result p3

    .line 355
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 356
    .line 357
    .line 358
    sget p3, Ll/qdc0;->c:I

    .line 359
    .line 360
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 361
    .line 362
    .line 363
    move-result-object p3

    .line 364
    check-cast p3, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 365
    .line 366
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 367
    .line 368
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 369
    .line 370
    invoke-virtual {p3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 371
    .line 372
    .line 373
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 374
    .line 375
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 376
    .line 377
    invoke-virtual {p3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 378
    .line 379
    .line 380
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 381
    .line 382
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 383
    .line 384
    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 385
    .line 386
    .line 387
    move-result-wide v5

    .line 388
    invoke-virtual {p3, v5, v6}, Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;->setDateMillis(J)V

    .line 389
    .line 390
    .line 391
    new-instance p3, Landroid/view/animation/AlphaAnimation;

    .line 392
    .line 393
    const/4 v5, 0x0

    .line 394
    const/high16 v6, 0x3f800000    # 1.0f

    .line 395
    .line 396
    invoke-direct {p3, v5, v6}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 397
    .line 398
    .line 399
    const-wide/16 v7, 0x12c

    .line 400
    .line 401
    invoke-virtual {p3, v7, v8}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 402
    .line 403
    .line 404
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 405
    .line 406
    invoke-virtual {v9, p3}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 407
    .line 408
    .line 409
    new-instance p3, Landroid/view/animation/AlphaAnimation;

    .line 410
    .line 411
    invoke-direct {p3, v6, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {p3, v7, v8}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 415
    .line 416
    .line 417
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator;

    .line 418
    .line 419
    invoke-virtual {v5, p3}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 420
    .line 421
    .line 422
    sget p3, Ll/qdc0;->q:I

    .line 423
    .line 424
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 425
    .line 426
    .line 427
    move-result-object p3

    .line 428
    check-cast p3, Landroid/widget/Button;

    .line 429
    .line 430
    new-instance v5, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$a;

    .line 431
    .line 432
    invoke-direct {v5, p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$a;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {p3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 436
    .line 437
    .line 438
    invoke-static {}, Ll/na00;->a()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v5

    .line 442
    invoke-static {v5}, Ll/ooj0;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 443
    .line 444
    .line 445
    move-result-object v5

    .line 446
    invoke-virtual {p3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 447
    .line 448
    .line 449
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G0:Ljava/lang/String;

    .line 450
    .line 451
    if-eqz v5, :cond_4

    .line 452
    .line 453
    invoke-virtual {p3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 454
    .line 455
    .line 456
    goto :goto_3

    .line 457
    :cond_4
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F0:I

    .line 458
    .line 459
    invoke-virtual {p3, v5}, Landroid/widget/TextView;->setText(I)V

    .line 460
    .line 461
    .line 462
    :goto_3
    sget v5, Ll/qdc0;->d:I

    .line 463
    .line 464
    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 465
    .line 466
    .line 467
    move-result-object v5

    .line 468
    check-cast v5, Landroid/widget/Button;

    .line 469
    .line 470
    new-instance v6, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;

    .line 471
    .line 472
    invoke-direct {v6, p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$b;-><init>(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 476
    .line 477
    .line 478
    invoke-static {}, Ll/na00;->a()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v6

    .line 482
    invoke-static {v6}, Ll/ooj0;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 483
    .line 484
    .line 485
    move-result-object v6

    .line 486
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 487
    .line 488
    .line 489
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I0:Ljava/lang/String;

    .line 490
    .line 491
    if-eqz v6, :cond_5

    .line 492
    .line 493
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 494
    .line 495
    .line 496
    goto :goto_4

    .line 497
    :cond_5
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->H0:I

    .line 498
    .line 499
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 500
    .line 501
    .line 502
    :goto_4
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->isCancelable()Z

    .line 503
    .line 504
    .line 505
    move-result v6

    .line 506
    const/16 v7, 0x8

    .line 507
    .line 508
    if-eqz v6, :cond_6

    .line 509
    .line 510
    move v6, v2

    .line 511
    goto :goto_5

    .line 512
    :cond_6
    move v6, v7

    .line 513
    :goto_5
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 514
    .line 515
    .line 516
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 517
    .line 518
    if-ne v6, v1, :cond_7

    .line 519
    .line 520
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 521
    .line 522
    .line 523
    move-result-object v6

    .line 524
    invoke-static {v6}, Ll/tnk0;->c(Landroid/content/Context;)I

    .line 525
    .line 526
    .line 527
    move-result v6

    .line 528
    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 529
    .line 530
    :cond_7
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F:Landroid/widget/TextView;

    .line 531
    .line 532
    if-eqz v6, :cond_8

    .line 533
    .line 534
    iget v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 535
    .line 536
    invoke-static {v8}, Ll/tnk0;->a(I)I

    .line 537
    .line 538
    .line 539
    move-result v8

    .line 540
    invoke-virtual {v6, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 541
    .line 542
    .line 543
    :cond_8
    sget v6, Ll/qdc0;->k:I

    .line 544
    .line 545
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 546
    .line 547
    .line 548
    move-result-object v6

    .line 549
    iget v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 550
    .line 551
    invoke-virtual {v6, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 552
    .line 553
    .line 554
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 555
    .line 556
    invoke-virtual {p3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 557
    .line 558
    .line 559
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 560
    .line 561
    invoke-virtual {v5, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    .line 565
    .line 566
    .line 567
    move-result-object p3

    .line 568
    if-nez p3, :cond_9

    .line 569
    .line 570
    sget p3, Ll/qdc0;->l:I

    .line 571
    .line 572
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 573
    .line 574
    .line 575
    move-result-object p3

    .line 576
    invoke-virtual {p3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 577
    .line 578
    .line 579
    :cond_9
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->q4(Z)V

    .line 580
    .line 581
    .line 582
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k4(I)V

    .line 583
    .line 584
    .line 585
    if-eq v3, v1, :cond_b

    .line 586
    .line 587
    if-nez v0, :cond_a

    .line 588
    .line 589
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 590
    .line 591
    invoke-virtual {p3, v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->h(I)V

    .line 592
    .line 593
    .line 594
    goto :goto_6

    .line 595
    :cond_a
    const/4 p3, 0x1

    .line 596
    if-ne v0, p3, :cond_b

    .line 597
    .line 598
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 599
    .line 600
    invoke-virtual {p3, v3, v4}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->g(II)V

    .line 601
    .line 602
    .line 603
    :cond_b
    :goto_6
    new-instance p3, Ll/yxk;

    .line 604
    .line 605
    invoke-direct {p3, p2}, Ll/yxk;-><init>(Landroid/content/Context;)V

    .line 606
    .line 607
    .line 608
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K0:Ll/yxk;

    .line 609
    .line 610
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W3()V

    .line 611
    .line 612
    .line 613
    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->D:Landroid/content/DialogInterface$OnDismissListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K0:Ll/yxk;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/yxk;->g()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k0:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K0:Ll/yxk;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yxk;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v2, "year"

    .line 12
    .line 13
    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const-string v2, "month"

    .line 24
    .line 25
    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 29
    .line 30
    const/4 v2, 0x5

    .line 31
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v2, "day"

    .line 36
    .line 37
    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    const-string v0, "week_start"

    .line 41
    .line 42
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->N:I

    .line 43
    .line 44
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    const-string v0, "year_start"

    .line 48
    .line 49
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->O:I

    .line 50
    .line 51
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    const-string v0, "year_end"

    .line 55
    .line 56
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->P:I

    .line 57
    .line 58
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    const-string v0, "current_view"

    .line 62
    .line 63
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 64
    .line 65
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->M:I

    .line 69
    .line 70
    if-nez v0, :cond_0

    .line 71
    .line 72
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getMostVisiblePosition()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    if-ne v0, v1, :cond_1

    .line 80
    .line 81
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/YearPickerView;->getFirstPositionOffset()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    const-string v2, "list_position_offset"

    .line 94
    .line 95
    invoke-virtual {p1, v2, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    const/4 v0, -0x1

    .line 100
    :goto_0
    const-string v1, "list_position"

    .line 101
    .line 102
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    const-string v0, "min_date"

    .line 106
    .line 107
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->R:Ljava/util/Calendar;

    .line 108
    .line 109
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 110
    .line 111
    .line 112
    const-string v0, "max_date"

    .line 113
    .line 114
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->S:Ljava/util/Calendar;

    .line 115
    .line 116
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 117
    .line 118
    .line 119
    const-string v0, "highlighted_days"

    .line 120
    .line 121
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->T:[Ljava/util/Calendar;

    .line 122
    .line 123
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 124
    .line 125
    .line 126
    const-string v0, "selectable_days"

    .line 127
    .line 128
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->U:[Ljava/util/Calendar;

    .line 129
    .line 130
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 131
    .line 132
    .line 133
    const-string v0, "disabled_days"

    .line 134
    .line 135
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->V:[Ljava/util/Calendar;

    .line 136
    .line 137
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 138
    .line 139
    .line 140
    const-string v0, "theme_dark"

    .line 141
    .line 142
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 143
    .line 144
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 145
    .line 146
    .line 147
    const-string v0, "theme_dark_changed"

    .line 148
    .line 149
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->X:Z

    .line 150
    .line 151
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 152
    .line 153
    .line 154
    const-string v0, "accent"

    .line 155
    .line 156
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 157
    .line 158
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 159
    .line 160
    .line 161
    const-string v0, "vibrate"

    .line 162
    .line 163
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Z:Z

    .line 164
    .line 165
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 166
    .line 167
    .line 168
    const-string v0, "dismiss"

    .line 169
    .line 170
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->k0:Z

    .line 171
    .line 172
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 173
    .line 174
    .line 175
    const-string v0, "auto_dismiss"

    .line 176
    .line 177
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->p0:Z

    .line 178
    .line 179
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 180
    .line 181
    .line 182
    const-string v0, "default_view"

    .line 183
    .line 184
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->E0:I

    .line 185
    .line 186
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 187
    .line 188
    .line 189
    const-string v0, "title"

    .line 190
    .line 191
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    const-string v0, "ok_resid"

    .line 197
    .line 198
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->F0:I

    .line 199
    .line 200
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 201
    .line 202
    .line 203
    const-string v0, "ok_string"

    .line 204
    .line 205
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->G0:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    const-string v0, "cancel_resid"

    .line 211
    .line 212
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->H0:I

    .line 213
    .line 214
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 215
    .line 216
    .line 217
    const-string v0, "cancel_string"

    .line 218
    .line 219
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->I0:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    const-string v0, "version"

    .line 225
    .line 226
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->J0:Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$Version;

    .line 227
    .line 228
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 229
    .line 230
    .line 231
    const-string v0, "show_on_recreate"

    .line 232
    .line 233
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Q0:Z

    .line 234
    .line 235
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Y:I

    .line 2
    .line 3
    return p0
.end method

.method public w()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->Z:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->K0:Ll/yxk;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yxk;->h()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->W:Z

    .line 2
    .line 3
    return p0
.end method

.method public z2()Lcom/wdullaer/materialdatetimepicker/date/b$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->z:Ljava/util/Calendar;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>(Ljava/util/Calendar;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
