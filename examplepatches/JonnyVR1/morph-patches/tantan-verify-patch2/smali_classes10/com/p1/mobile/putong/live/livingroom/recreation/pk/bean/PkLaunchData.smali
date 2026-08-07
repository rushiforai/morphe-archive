.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g0m;


# instance fields
.field public message:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

.field public pkId:Ljava/lang/String;

.field public pkView:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

.field public pkViewInternal:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkView:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 32
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->message:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    .line 33
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "create PkLaunchData from LivePkMessage,message:"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkView:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkId:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string p1, "create PkLaunchData from onGoingId,id:"

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkViewInternal:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->message:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "create PkLaunchData from LivePkMessage,message:"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Ljava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkViewInternal:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkId:Ljava/lang/String;

    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "create PkLaunchData from onGoingId,id:"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    return-void
.end method
