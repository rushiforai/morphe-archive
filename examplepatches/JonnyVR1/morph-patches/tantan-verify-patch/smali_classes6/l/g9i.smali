.class public Ll/g9i;
.super Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;J)V
    .locals 3

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_5

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    new-instance v1, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v2, "duration"

    .line 28
    .line 29
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance p2, Ll/q4f;

    .line 37
    .line 38
    invoke-direct {p2}, Ll/q4f;-><init>()V

    .line 39
    .line 40
    .line 41
    sget-object p3, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 42
    .line 43
    iput-object p3, p2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 44
    .line 45
    const-string p3, "moments"

    .line 46
    .line 47
    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_0

    .line 52
    .line 53
    const-string p0, "p_moments_view"

    .line 54
    .line 55
    iput-object p0, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const-string p3, "nearby"

    .line 59
    .line 60
    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-eqz p3, :cond_1

    .line 65
    .line 66
    const-string p0, "p_nearby"

    .line 67
    .line 68
    iput-object p0, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const-string p3, "follow"

    .line 72
    .line 73
    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    const-string p0, "p_follow"

    .line 80
    .line 81
    iput-object p0, p2, Ll/q4f;->n:Ljava/lang/String;

    .line 82
    .line 83
    :cond_2
    :goto_0
    instance-of p0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 84
    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    const-string p0, "e_UploadImageDuration_feed"

    .line 88
    .line 89
    iput-object p0, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->z(Ljava/util/List;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "image_size"

    .line 98
    .line 99
    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_3
    instance-of p0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 104
    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    const-string p0, "e_UploadVideoDuration_feed"

    .line 108
    .line 109
    iput-object p0, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->B(Lcom/p1/mobile/putong/data/Media;)J

    .line 112
    .line 113
    .line 114
    move-result-wide p0

    .line 115
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string p1, "video_size"

    .line 120
    .line 121
    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    :cond_4
    :goto_1
    invoke-static {p2, v1}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    return-void
.end method
