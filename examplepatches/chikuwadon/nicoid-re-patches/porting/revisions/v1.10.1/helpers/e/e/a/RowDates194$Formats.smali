.class final Le/e/a/RowDates194$Formats;
.super Ljava/lang/Object;
.source "RowDates194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/RowDates194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Formats"
.end annotation


# instance fields
.field final input:[Ljava/text/SimpleDateFormat;

.field final output:Ljava/text/SimpleDateFormat;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    # getter for: Le/e/a/RowDates194;->PATTERNS:[Ljava/lang/String;
    invoke-static {}, Le/e/a/RowDates194;->access$0()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Ljava/text/SimpleDateFormat;

    iput-object v0, p0, Le/e/a/RowDates194$Formats;->input:[Ljava/text/SimpleDateFormat;

    const-string v0, "yyyy/MM/dd HH:mm"

    # invokes: Le/e/a/RowDates194;->create(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    invoke-static {v0}, Le/e/a/RowDates194;->access$1(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    iput-object v0, p0, Le/e/a/RowDates194$Formats;->output:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/RowDates194$Formats;)V
    .registers 2

    .line 13
    invoke-direct {p0}, Le/e/a/RowDates194$Formats;-><init>()V

    return-void
.end method


# virtual methods
.method get(I)Ljava/text/SimpleDateFormat;
    .registers 4

    .line 13
    iget-object v0, p0, Le/e/a/RowDates194$Formats;->input:[Ljava/text/SimpleDateFormat;

    aget-object v0, v0, p1

    if-nez v0, :cond_14

    iget-object v0, p0, Le/e/a/RowDates194$Formats;->input:[Ljava/text/SimpleDateFormat;

    # getter for: Le/e/a/RowDates194;->PATTERNS:[Ljava/lang/String;
    invoke-static {}, Le/e/a/RowDates194;->access$0()[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, p1

    # invokes: Le/e/a/RowDates194;->create(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    invoke-static {v1}, Le/e/a/RowDates194;->access$1(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v1

    aput-object v1, v0, p1

    :cond_14
    iget-object v0, p0, Le/e/a/RowDates194$Formats;->input:[Ljava/text/SimpleDateFormat;

    aget-object p1, v0, p1

    return-object p1
.end method
