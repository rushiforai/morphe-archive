.class public Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame$HdrMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Chromaticity"
.end annotation


# instance fields
.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;->x:I

    .line 5
    .line 6
    iput p2, p0, Lio/agora/base/VideoFrame$HdrMetadata$Chromaticity;->y:I

    .line 7
    .line 8
    return-void
.end method
