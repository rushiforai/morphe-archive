.class public Lcom/momo/rtcbase/PeerConnection$IntervalRange;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IntervalRange"
.end annotation


# instance fields
.field private final max:I

.field private final min:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/rtcbase/PeerConnection$IntervalRange;->min:I

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/PeerConnection$IntervalRange;->max:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getMax()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IntervalRange"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$IntervalRange;->max:I

    .line 2
    .line 3
    return p0
.end method

.method public getMin()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "IntervalRange"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$IntervalRange;->min:I

    .line 2
    .line 3
    return p0
.end method
