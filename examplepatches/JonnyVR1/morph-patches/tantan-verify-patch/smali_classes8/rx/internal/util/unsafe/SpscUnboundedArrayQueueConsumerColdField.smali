.class abstract Lrx/internal/util/unsafe/SpscUnboundedArrayQueueConsumerColdField;
.super Lrx/internal/util/unsafe/SpscUnboundedArrayQueueL2Pad;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpscUnboundedArrayQueueL2Pad<",
        "TE;>;"
    }
.end annotation


# instance fields
.field protected consumerBuffer:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TE;"
        }
    .end annotation
.end field

.field protected consumerMask:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lrx/internal/util/unsafe/SpscUnboundedArrayQueueL2Pad;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
