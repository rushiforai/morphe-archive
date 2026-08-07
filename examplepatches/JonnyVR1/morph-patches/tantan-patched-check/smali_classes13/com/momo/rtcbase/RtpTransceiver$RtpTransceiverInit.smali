.class public final Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RtpTransceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RtpTransceiverInit"
.end annotation


# instance fields
.field private final direction:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

.field private final streamIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    sget-object v0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->SEND_RECV:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    invoke-direct {p0, v0}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;-><init>(Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;)V
    .locals 1

    .line 14
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, p1, v0}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;-><init>(Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;->direction:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;->streamIds:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getDirectionNativeIndex()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RtpTransceiverInit"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;->direction:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->getNativeIndex()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getStreamIds()Ljava/util/List;
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RtpTransceiverInit"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;->streamIds:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
