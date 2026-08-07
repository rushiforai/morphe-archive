.class Lcom/ss/bytertc/base/media/camera/Histogram;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final handle:J


# direct methods
.method private constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/ss/bytertc/base/media/camera/Histogram;->handle:J

    .line 5
    .line 6
    return-void
.end method

.method public static createCounts(Ljava/lang/String;III)Lcom/ss/bytertc/base/media/camera/Histogram;
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/Histogram;->nativeCreateCounts(Ljava/lang/String;III)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-direct {v0, p0, p1}, Lcom/ss/bytertc/base/media/camera/Histogram;-><init>(J)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static createEnumeration(Ljava/lang/String;I)Lcom/ss/bytertc/base/media/camera/Histogram;
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Histogram;->nativeCreateEnumeration(Ljava/lang/String;I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-direct {v0, p0, p1}, Lcom/ss/bytertc/base/media/camera/Histogram;-><init>(J)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method private static native nativeAddSample(JI)V
.end method

.method private static native nativeCreateCounts(Ljava/lang/String;III)J
.end method

.method private static native nativeCreateEnumeration(Ljava/lang/String;I)J
.end method


# virtual methods
.method public addSample(I)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/camera/Histogram;->handle:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/base/media/camera/Histogram;->nativeAddSample(JI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
