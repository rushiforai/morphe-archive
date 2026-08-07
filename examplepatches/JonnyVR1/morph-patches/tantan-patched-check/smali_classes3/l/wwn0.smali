.class public Ll/wwn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;

.field public final b:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/ayn0;


# direct methods
.method public constructor <init>(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ayn0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/wwn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;

    .line 5
    .line 6
    iput-object p3, p0, Ll/wwn0;->b:Ll/nsv;

    .line 7
    .line 8
    iput-object p1, p0, Ll/wwn0;->c:Ll/ayn0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/wwn0;->c:Ll/ayn0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/wwn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;

    .line 7
    .line 8
    iget-object p0, p0, Ll/wwn0;->b:Ll/nsv;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;->f(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;Ll/nsv;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->y8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wwn0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndHeartBeatItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
