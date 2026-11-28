.class final Lcom/google/common/math/LinearTransformation$NaNLinearTransformation;
.super Lcom/google/common/math/LinearTransformation;
.source "LinearTransformation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/math/LinearTransformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NaNLinearTransformation"
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/math/LinearTransformation$NaNLinearTransformation;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 286
    new-instance v0, Lcom/google/common/math/LinearTransformation$NaNLinearTransformation;

    invoke-direct {v0}, Lcom/google/common/math/LinearTransformation$NaNLinearTransformation;-><init>()V

    sput-object v0, Lcom/google/common/math/LinearTransformation$NaNLinearTransformation;->INSTANCE:Lcom/google/common/math/LinearTransformation$NaNLinearTransformation;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 284
    invoke-direct {p0}, Lcom/google/common/math/LinearTransformation;-><init>()V

    return-void
.end method


# virtual methods
.method public inverse()Lcom/google/common/math/LinearTransformation;
    .registers 1

    return-object p0
.end method

.method public isHorizontal()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public isVertical()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public slope()D
    .registers 3

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 315
    const-string p0, "NaN"

    return-object p0
.end method

.method public transform(D)D
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "x"
        }
    .end annotation

    const-wide/high16 p0, 0x7ff8000000000000L    # Double.NaN

    return-wide p0
.end method
