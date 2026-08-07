.class public Ltech/sud/gip/core/network/detection/NetworkDetectionStep;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final detailList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;",
            ">;"
        }
    .end annotation
.end field

.field public identifier:I

.field public method:Ljava/lang/String;

.field public protocol:Ljava/lang/String;

.field public result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

.field public status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->WAITING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->detailList:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionStep;
    .locals 4

    .line 1
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 7
    .line 8
    iput v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 9
    .line 10
    iget-object v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 19
    .line 20
    iput-object v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 21
    .line 22
    iget-object v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->detailList:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    iget-object v3, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->detailList:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {v2}, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object p0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iput-object p0, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 61
    .line 62
    :cond_2
    return-object v0
.end method
