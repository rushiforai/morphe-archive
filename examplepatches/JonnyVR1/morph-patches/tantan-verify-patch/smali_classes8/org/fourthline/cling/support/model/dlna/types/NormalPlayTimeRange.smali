.class public Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final PREFIX:Ljava/lang/String; = "npt="


# instance fields
.field private timeDuration:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

.field private timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

.field private timeStart:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;


# direct methods
.method public constructor <init>(JJ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;-><init>(J)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeStart:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 10
    .line 11
    new-instance p1, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 12
    .line 13
    invoke-direct {p1, p3, p4}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;-><init>(J)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeStart:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 21
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeStart:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 24
    iput-object p2, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 25
    iput-object p3, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeDuration:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/types/InvalidValueException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 113
    invoke-static {p0, v0}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->valueOf(Ljava/lang/String;Z)Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;Z)Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/types/InvalidValueException;
        }
    .end annotation

    .line 1
    const-string v0, "npt="

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "[-/]"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    array-length v1, v0

    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-eq v1, v3, :cond_1

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    if-eq v1, v4, :cond_0

    .line 27
    .line 28
    const/4 v5, 0x3

    .line 29
    if-ne v1, v5, :cond_4

    .line 30
    .line 31
    aget-object v1, v0, v4

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    aget-object v1, v0, v4

    .line 40
    .line 41
    const-string v5, "*"

    .line 42
    .line 43
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_0

    .line 48
    .line 49
    aget-object v1, v0, v4

    .line 50
    .line 51
    invoke-static {v1}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    move-object v1, v2

    .line 57
    :goto_0
    aget-object v4, v0, v3

    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_2

    .line 64
    .line 65
    aget-object v2, v0, v3

    .line 66
    .line 67
    invoke-static {v2}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move-object v1, v2

    .line 73
    :cond_2
    :goto_1
    const/4 v4, 0x0

    .line 74
    aget-object v5, v0, v4

    .line 75
    .line 76
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-eqz v5, :cond_4

    .line 81
    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    if-eqz p1, :cond_4

    .line 85
    .line 86
    array-length p1, v0

    .line 87
    if-le p1, v3, :cond_4

    .line 88
    .line 89
    :cond_3
    aget-object p0, v0, v4

    .line 90
    .line 91
    invoke-static {p0}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    new-instance p1, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;

    .line 96
    .line 97
    invoke-direct {p1, p0, v2, v1}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;-><init>(Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;)V

    .line 98
    .line 99
    .line 100
    return-object p1

    .line 101
    :cond_4
    new-instance p1, Lorg/fourthline/cling/model/types/InvalidValueException;

    .line 102
    .line 103
    const-string v0, "Can\'t parse NormalPlayTimeRange: "

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-direct {p1, p0}, Lorg/fourthline/cling/model/types/InvalidValueException;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    throw p1
.end method


# virtual methods
.method public getString()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 86
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->getString(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getString(Z)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "npt="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeStart:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 9
    .line 10
    invoke-virtual {v1}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;->getString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "-"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 39
    .line 40
    invoke-virtual {v0}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;->getString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :cond_0
    if-eqz p1, :cond_2

    .line 52
    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, "/"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeDuration:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 67
    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;->getString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    const-string p0, "*"

    .line 76
    .line 77
    :goto_0
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :cond_2
    return-object v0
.end method

.method public getTimeDuration()Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeDuration:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeEnd()Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeEnd:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeStart()Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTimeRange;->timeStart:Lorg/fourthline/cling/support/model/dlna/types/NormalPlayTime;

    .line 2
    .line 3
    return-object p0
.end method
