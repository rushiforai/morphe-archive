.class public Ll/u9t;
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

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    return v0

    .line 10
    :cond_1
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;->showLiveId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_2

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_2
    return v0
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ljava/lang/String;
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;->showLiveId:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public static c(Ll/oo2;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oo2;->I0()Ll/ajt$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ajt$a;->g()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "officialShow"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v0
.end method

.method public static e(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    instance-of v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;->showLiveId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    return v0
.end method
