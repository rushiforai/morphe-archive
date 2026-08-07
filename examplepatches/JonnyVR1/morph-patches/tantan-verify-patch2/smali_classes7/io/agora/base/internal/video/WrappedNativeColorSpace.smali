.class public Lio/agora/base/internal/video/WrappedNativeColorSpace;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$ColorSpace;


# instance fields
.field private matrix:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

.field private primary:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field private range:Lio/agora/base/VideoFrame$ColorSpace$Range;

.field private transfer:Lio/agora/base/VideoFrame$ColorSpace$Transfer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Range;->Invalid:Lio/agora/base/VideoFrame$ColorSpace$Range;

    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->range:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 111
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->matrix:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 112
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->transfer:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 113
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->primary:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 6
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Range;->Invalid:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 5
    .line 6
    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->range:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 7
    .line 8
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 9
    .line 10
    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->matrix:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 11
    .line 12
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 13
    .line 14
    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->transfer:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 15
    .line 16
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 17
    .line 18
    iput-object v0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->primary:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 19
    .line 20
    invoke-static {}, Lio/agora/base/VideoFrame$ColorSpace$Range;->values()[Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    array-length v1, v0

    .line 25
    const/4 v2, 0x0

    .line 26
    move v3, v2

    .line 27
    :goto_0
    if-ge v3, v1, :cond_1

    .line 28
    .line 29
    aget-object v4, v0, v3

    .line 30
    .line 31
    invoke-virtual {v4}, Lio/agora/base/VideoFrame$ColorSpace$Range;->getRange()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-ne v5, p1, :cond_0

    .line 36
    .line 37
    iput-object v4, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->range:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    :goto_1
    invoke-static {}, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->values()[Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    array-length v0, p1

    .line 48
    move v1, v2

    .line 49
    :goto_2
    if-ge v1, v0, :cond_3

    .line 50
    .line 51
    aget-object v3, p1, v1

    .line 52
    .line 53
    invoke-virtual {v3}, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->getMatrix()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-ne v4, p2, :cond_2

    .line 58
    .line 59
    iput-object v3, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->matrix:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    :goto_3
    invoke-static {}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->values()[Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    array-length p2, p1

    .line 70
    move v0, v2

    .line 71
    :goto_4
    if-ge v0, p2, :cond_5

    .line 72
    .line 73
    aget-object v1, p1, v0

    .line 74
    .line 75
    invoke-virtual {v1}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-ne v3, p3, :cond_4

    .line 80
    .line 81
    iput-object v1, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->transfer:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 82
    .line 83
    goto :goto_5

    .line 84
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_5
    :goto_5
    invoke-static {}, Lio/agora/base/VideoFrame$ColorSpace$Primary;->values()[Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    array-length p2, p1

    .line 92
    :goto_6
    if-ge v2, p2, :cond_7

    .line 93
    .line 94
    aget-object p3, p1, v2

    .line 95
    .line 96
    invoke-virtual {p3}, Lio/agora/base/VideoFrame$ColorSpace$Primary;->getPrimary()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-ne v0, p4, :cond_6

    .line 101
    .line 102
    iput-object p3, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->primary:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 106
    .line 107
    goto :goto_6

    .line 108
    :cond_7
    return-void
.end method


# virtual methods
.method public getHdrMetadata()Lio/agora/base/VideoFrame$HdrMetadata;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->matrix:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrimary()Lio/agora/base/VideoFrame$ColorSpace$Primary;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->primary:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRange()Lio/agora/base/VideoFrame$ColorSpace$Range;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->range:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransfer()Lio/agora/base/VideoFrame$ColorSpace$Transfer;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeColorSpace;->transfer:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 2
    .line 3
    return-object p0
.end method
