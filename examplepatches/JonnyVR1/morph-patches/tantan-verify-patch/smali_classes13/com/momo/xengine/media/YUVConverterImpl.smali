.class final Lcom/momo/xengine/media/YUVConverterImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IYUVConverter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public native nativeI420ToRGBA([B[BII)Z
.end method

.method public yuv420pToRGBA([BII[B)Z
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    if-nez p4, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    array-length v1, p1

    .line 8
    int-to-double v1, v1

    .line 9
    mul-int v3, p2, p3

    .line 10
    .line 11
    int-to-double v4, v3

    .line 12
    const-wide/high16 v6, 0x3ff8000000000000L    # 1.5

    .line 13
    .line 14
    mul-double/2addr v4, v6

    .line 15
    cmpg-double v1, v1, v4

    .line 16
    .line 17
    if-gez v1, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    array-length v1, p4

    .line 21
    mul-int/lit8 v3, v3, 0x4

    .line 22
    .line 23
    if-ge v1, v3, :cond_2

    .line 24
    .line 25
    return v0

    .line 26
    :cond_2
    invoke-virtual {p0, p1, p4, p2, p3}, Lcom/momo/xengine/media/YUVConverterImpl;->nativeI420ToRGBA([B[BII)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_3
    :goto_0
    return v0
.end method
