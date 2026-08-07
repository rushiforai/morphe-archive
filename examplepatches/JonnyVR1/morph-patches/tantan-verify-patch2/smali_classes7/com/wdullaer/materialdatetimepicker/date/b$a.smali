.class public Lcom/wdullaer/materialdatetimepicker/date/b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/util/Calendar;

.field b:I

.field c:I

.field d:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c(J)V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b(III)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c(J)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Calendar;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 24
    .line 25
    return-void
.end method

.method private c(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a:Ljava/util/Calendar;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a:Ljava/util/Calendar;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a:Ljava/util/Calendar;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a:Ljava/util/Calendar;

    .line 17
    .line 18
    const/4 p2, 0x2

    .line 19
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 24
    .line 25
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a:Ljava/util/Calendar;

    .line 26
    .line 27
    const/4 p2, 0x1

    .line 28
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 33
    .line 34
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->a:Ljava/util/Calendar;

    .line 35
    .line 36
    const/4 p2, 0x5

    .line 37
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public a(Lcom/wdullaer/materialdatetimepicker/date/b$a;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 2
    .line 3
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 4
    .line 5
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 8
    .line 9
    iget p1, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 10
    .line 11
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 12
    .line 13
    return-void
.end method

.method public b(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 2
    .line 3
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 4
    .line 5
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 6
    .line 7
    return-void
.end method
