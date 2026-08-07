.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/api/VoiceGiftWallApiProvider;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 4
    .line 5
    return-object p0
.end method

.method public static getGiftWallList(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/live/voice-live-users/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/gifts"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "liveId"

    .line 33
    .line 34
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "getGiftWallList"

    .line 43
    .line 44
    invoke-static {p0, p1}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/ljn0;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/ljn0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public static requestGiftWallDetail(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-gift-wall/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/detail/"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "requestGiftWallDetail"

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ll/mjn0;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/mjn0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static requestGiftWallList(Ljava/lang/String;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-gift-wall/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/list"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    const-string p1, "light"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p1, "unlight"

    .line 38
    .line 39
    :goto_0
    const-string v0, "tab"

    .line 40
    .line 41
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "requestGiftWallList"

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p1, Ll/njn0;

    .line 56
    .line 57
    invoke-direct {p1}, Ll/njn0;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method
