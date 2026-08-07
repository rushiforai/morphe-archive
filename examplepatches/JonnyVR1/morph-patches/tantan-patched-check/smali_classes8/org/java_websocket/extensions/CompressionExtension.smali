.class public abstract Lorg/java_websocket/extensions/CompressionExtension;
.super Lorg/java_websocket/extensions/DefaultExtension;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/java_websocket/extensions/DefaultExtension;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public isFrameValid(Lorg/java_websocket/framing/Framedata;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/java_websocket/exceptions/InvalidDataException;
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lorg/java_websocket/framing/DataFrame;

    .line 2
    .line 3
    const-string v0, " RSV3: "

    .line 4
    .line 5
    const-string v1, " RSV2: "

    .line 6
    .line 7
    const-string v2, "bad rsv RSV1: "

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV2()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV3()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance p0, Lorg/java_websocket/exceptions/InvalidFrameException;

    .line 25
    .line 26
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV1()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV2()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV3()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    new-instance v5, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {p0, p1}, Lorg/java_websocket/exceptions/InvalidFrameException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_1
    :goto_0
    instance-of p0, p1, Lorg/java_websocket/framing/ControlFrame;

    .line 67
    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV1()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_2

    .line 75
    .line 76
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV2()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_2

    .line 81
    .line 82
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV3()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_2

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    new-instance p0, Lorg/java_websocket/exceptions/InvalidFrameException;

    .line 90
    .line 91
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV1()Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV2()Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    invoke-interface {p1}, Lorg/java_websocket/framing/Framedata;->isRSV3()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    new-instance v5, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-direct {p0, p1}, Lorg/java_websocket/exceptions/InvalidFrameException;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    throw p0

    .line 131
    :cond_3
    :goto_1
    return-void
.end method
