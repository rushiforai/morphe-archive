.class public Ll/x5k;
.super Ll/owl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/owl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "voice.live.activity.refresh"

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const-string p0, "voice.live.counter.refresh"

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 26
    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ll/qam;->h()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "live/updateVoiceActivitiesNum"

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "live/updateNewVoiceActivitiesNum"

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 25
    .line 26
    iget-object p0, p0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 27
    .line 28
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/qam;->h()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public k(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "voice.live.activity.refresh"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "voice.live.counter.refresh"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public l(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "live/updateVoiceActivitiesNum"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "live/updateNewVoiceActivitiesNum"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method
