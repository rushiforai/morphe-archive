.class Landroidx/exifinterface/media/ExifInterface$Rational;
.super Ljava/lang/Object;
.source "ExifInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/exifinterface/media/ExifInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Rational"
.end annotation


# instance fields
.field public final denominator:J

.field public final numerator:J


# direct methods
.method private constructor <init>(JJ)V
    .registers 8

    .line 3190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-nez v2, :cond_0

    .line 3193
    iput-wide v0, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    const-wide/16 p1, 0x1

    .line 3194
    iput-wide p1, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    return-void

    .line 3197
    :cond_0
    iput-wide p1, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    .line 3198
    iput-wide p3, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    return-void
.end method

.method synthetic constructor <init>(JJLandroidx/exifinterface/media/ExifInterface$1;)V
    .registers 6

    .line 3186
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/exifinterface/media/ExifInterface$Rational;-><init>(JJ)V

    return-void
.end method

.method public static createFromDouble(D)Landroidx/exifinterface/media/ExifInterface$Rational;
    .registers 25

    const-wide/high16 v0, 0x43e0000000000000L    # 9.223372036854776E18

    cmpl-double v0, p0, v0

    const-wide/16 v3, 0x1

    if-gez v0, :cond_2

    const-wide/high16 v5, -0x3c20000000000000L    # -9.223372036854776E18

    cmpg-double v0, p0, v5

    if-lez v0, :cond_2

    .line 3213
    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v5

    const-wide v7, 0x3e45798ee2308c3aL    # 1.0E-8

    mul-double/2addr v7, v5

    const-wide/16 v9, 0x0

    move-wide v11, v3

    move-wide v15, v5

    move-wide v13, v9

    :goto_0
    const-wide/high16 v17, 0x3ff0000000000000L    # 1.0

    rem-double v19, v15, v17

    const-wide/16 v21, 0x0

    sub-double v1, v15, v19

    double-to-long v0, v1

    mul-long v15, v0, v3

    add-long/2addr v13, v15

    mul-long/2addr v0, v9

    add-long/2addr v0, v11

    div-double v15, v17, v19

    long-to-double v11, v13

    move-wide/from16 v17, v3

    long-to-double v2, v0

    div-double/2addr v11, v2

    sub-double v2, v5, v11

    .line 3232
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    cmpl-double v2, v2, v7

    if-gtz v2, :cond_1

    .line 3234
    new-instance v2, Landroidx/exifinterface/media/ExifInterface$Rational;

    cmpg-double v3, p0, v21

    if-gez v3, :cond_0

    neg-long v13, v13

    :cond_0
    invoke-direct {v2, v13, v14, v0, v1}, Landroidx/exifinterface/media/ExifInterface$Rational;-><init>(JJ)V

    return-object v2

    :cond_1
    move-wide v11, v9

    move-wide v3, v13

    move-wide/from16 v13, v17

    move-wide v9, v0

    goto :goto_0

    :cond_2
    const-wide/16 v21, 0x0

    .line 3208
    new-instance v0, Landroidx/exifinterface/media/ExifInterface$Rational;

    cmpl-double v1, p0, v21

    if-lez v1, :cond_3

    const-wide v1, 0x7fffffffffffffffL

    goto :goto_1

    :cond_3
    const-wide/high16 v1, -0x8000000000000000L

    .line 3209
    :goto_1
    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/exifinterface/media/ExifInterface$Rational;-><init>(JJ)V

    return-object v0
.end method


# virtual methods
.method public calculate()D
    .registers 5

    .line 3243
    iget-wide v0, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    long-to-double v0, v0

    iget-wide v2, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    long-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 3239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
