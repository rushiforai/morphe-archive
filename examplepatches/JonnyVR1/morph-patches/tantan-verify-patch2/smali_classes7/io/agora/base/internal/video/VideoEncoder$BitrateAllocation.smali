.class public Lio/agora/base/internal/video/VideoEncoder$BitrateAllocation;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/VideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitrateAllocation"
.end annotation


# instance fields
.field public final bitratesBbs:[[I


# direct methods
.method public constructor <init>([[I)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "BitrateAllocation"
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/VideoEncoder$BitrateAllocation;->bitratesBbs:[[I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getSum()I
    .locals 8

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoder$BitrateAllocation;->bitratesBbs:[[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    move v3, v2

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    aget-object v4, p0, v2

    .line 10
    .line 11
    array-length v5, v4

    .line 12
    move v6, v1

    .line 13
    :goto_1
    if-ge v6, v5, :cond_0

    .line 14
    .line 15
    aget v7, v4, v6

    .line 16
    .line 17
    add-int/2addr v3, v7

    .line 18
    add-int/lit8 v6, v6, 0x1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v3
.end method
