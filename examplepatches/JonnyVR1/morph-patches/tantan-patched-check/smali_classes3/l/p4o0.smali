.class public Ll/p4o0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceLiveRoomBgSettingItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p4o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p4o0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Ll/p4o0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Ljava/lang/String;)V

    .line 10
    iput-object p3, p0, Ll/p4o0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceLiveRoomBgSettingItemView;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p4o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 5
    .line 6
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 7
    .line 8
    const-string v2, "me"

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/p4o0;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    :goto_0
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 24
    .line 25
    iget-object v0, p0, Ll/p4o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 26
    .line 27
    iget-object v1, p0, Ll/p4o0;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object p0, p0, Ll/p4o0;->c:Ljava/lang/Runnable;

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceLiveRoomBgSettingItemView;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;ZLjava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Ll/p4o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object p0, p0, Ll/p4o0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->ca:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceLiveRoomBgSettingItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p4o0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceLiveRoomBgSettingItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
