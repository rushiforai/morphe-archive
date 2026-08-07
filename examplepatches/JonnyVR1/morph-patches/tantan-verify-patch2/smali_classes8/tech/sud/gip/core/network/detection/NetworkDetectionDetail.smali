.class public Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public timestamp:J

.field public type:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;


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
.method public deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;
    .locals 3

    .line 1
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->type:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 7
    .line 8
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->type:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 9
    .line 10
    iget-wide v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->timestamp:J

    .line 11
    .line 12
    iput-wide v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->timestamp:J

    .line 13
    .line 14
    return-object v0
.end method
