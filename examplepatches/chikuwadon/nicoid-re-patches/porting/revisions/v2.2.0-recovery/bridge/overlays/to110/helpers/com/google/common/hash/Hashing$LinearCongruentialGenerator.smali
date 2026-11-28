.class final Lcom/google/common/hash/Hashing$LinearCongruentialGenerator;
.super Ljava/lang/Object;
.source "Hashing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/Hashing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LinearCongruentialGenerator"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 775
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static nextState(J)J
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    const-wide v0, 0x27bb2ee687b0b0fdL    # 2.694898184339827E-117

    mul-long/2addr p0, v0

    const-wide/16 v0, 0x1

    add-long/2addr p0, v0

    return-wide p0
.end method

.method static toDouble(J)D
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    const/16 v0, 0x21

    ushr-long/2addr p0, v0

    long-to-int p0, p0

    add-int/lit8 p0, p0, 0x1

    int-to-double p0, p0

    const-wide/high16 v0, 0x41e0000000000000L    # 2.147483648E9

    div-double/2addr p0, v0

    return-wide p0
.end method
