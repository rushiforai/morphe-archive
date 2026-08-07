.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private delay:J

.field private popup:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;

.field private scheme:Ljava/lang/String;

.field private uniqueId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->scheme:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->delay:J

    .line 7
    .line 8
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->uniqueId:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getDelay()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->delay:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->scheme:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setResultMessage(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveSchemePopupMessage;->popup:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$SchemePopup;

    .line 2
    .line 3
    return-object p0
.end method
