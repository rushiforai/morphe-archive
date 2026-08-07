.class Ll/xmp0$f;
.super Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xmp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0;


# direct methods
.method public constructor <init>(Ll/xmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onUserPublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;ZLcom/ss/bytertc/engine/type/MediaStreamType;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onUserPublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;ZLcom/ss/bytertc/engine/type/MediaStreamType;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p2}, Ll/xmp0;->G4(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "uid:"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ",type:"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "onUserPublishStream"

    .line 35
    .line 36
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p2, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->userId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    sget-object p2, Lcom/ss/bytertc/engine/type/MediaStreamType;->RTC_MEDIA_STREAM_TYPE_AUDIO:Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    if-ne p3, p2, :cond_0

    .line 57
    .line 58
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 59
    .line 60
    invoke-static {p2, p1, v0}, Ll/xmp0;->H4(Ll/xmp0;IZ)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sget-object p2, Lcom/ss/bytertc/engine/type/MediaStreamType;->RTC_MEDIA_STREAM_TYPE_VIDEO:Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 65
    .line 66
    if-ne p3, p2, :cond_1

    .line 67
    .line 68
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 69
    .line 70
    invoke-static {p2, p1, v0}, Ll/xmp0;->I4(Ll/xmp0;IZ)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    sget-object p2, Lcom/ss/bytertc/engine/type/MediaStreamType;->RTC_MEDIA_STREAM_TYPE_BOTH:Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 75
    .line 76
    if-ne p3, p2, :cond_2

    .line 77
    .line 78
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 79
    .line 80
    invoke-static {p2, p1, v0}, Ll/xmp0;->H4(Ll/xmp0;IZ)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 84
    .line 85
    invoke-static {p2, p1, v0}, Ll/xmp0;->I4(Ll/xmp0;IZ)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 89
    .line 90
    invoke-static {p0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onUserUnpublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onUserUnpublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xmp0;->J4(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "uid:"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, ",type:"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, ", reason:"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    const-string v1, "onUserUnpublishStream"

    .line 47
    .line 48
    filled-new-array {v1, p3}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {v0, p3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->userId:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    sget-object p3, Lcom/ss/bytertc/engine/type/MediaStreamType;->RTC_MEDIA_STREAM_TYPE_AUDIO:Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    if-ne p2, p3, :cond_0

    .line 69
    .line 70
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 71
    .line 72
    invoke-static {p2, p1, v0}, Ll/xmp0;->H4(Ll/xmp0;IZ)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    sget-object p3, Lcom/ss/bytertc/engine/type/MediaStreamType;->RTC_MEDIA_STREAM_TYPE_VIDEO:Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 77
    .line 78
    if-ne p2, p3, :cond_1

    .line 79
    .line 80
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 81
    .line 82
    invoke-static {p2, p1, v0}, Ll/xmp0;->I4(Ll/xmp0;IZ)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    sget-object p3, Lcom/ss/bytertc/engine/type/MediaStreamType;->RTC_MEDIA_STREAM_TYPE_BOTH:Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 87
    .line 88
    if-ne p2, p3, :cond_2

    .line 89
    .line 90
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 91
    .line 92
    invoke-static {p2, p1, v0}, Ll/xmp0;->I4(Ll/xmp0;IZ)V

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 96
    .line 97
    invoke-static {p2, p1, v0}, Ll/xmp0;->H4(Ll/xmp0;IZ)V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/xmp0$f;->a:Ll/xmp0;

    .line 101
    .line 102
    invoke-static {p0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 103
    .line 104
    .line 105
    return-void
.end method
