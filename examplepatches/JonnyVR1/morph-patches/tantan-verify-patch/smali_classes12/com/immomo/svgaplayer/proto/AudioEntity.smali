.class public final Lcom/immomo/svgaplayer/proto/AudioEntity;
.super Lcom/squareup/wire/Message;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/proto/AudioEntity$ProtoAdapter_AudioEntity;,
        Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message<",
        "Lcom/immomo/svgaplayer/proto/AudioEntity;",
        "Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final ADAPTER:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Lcom/immomo/svgaplayer/proto/AudioEntity;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_AUDIOKEY:Ljava/lang/String; = ""

.field public static final DEFAULT_ENDFRAME:Ljava/lang/Integer;

.field public static final DEFAULT_STARTFRAME:Ljava/lang/Integer;

.field public static final DEFAULT_STARTTIME:Ljava/lang/Integer;

.field public static final DEFAULT_TOTALTIME:Ljava/lang/Integer;

.field private static final serialVersionUID:J


# instance fields
.field public final audioKey:Ljava/lang/String;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#STRING"
        tag = 0x1
    .end annotation
.end field

.field public final endFrame:Ljava/lang/Integer;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#INT32"
        tag = 0x3
    .end annotation
.end field

.field public final startFrame:Ljava/lang/Integer;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#INT32"
        tag = 0x2
    .end annotation
.end field

.field public final startTime:Ljava/lang/Integer;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#INT32"
        tag = 0x4
    .end annotation
.end field

.field public final totalTime:Ljava/lang/Integer;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#INT32"
        tag = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/AudioEntity$ProtoAdapter_AudioEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/svgaplayer/proto/AudioEntity$ProtoAdapter_AudioEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/svgaplayer/proto/AudioEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/immomo/svgaplayer/proto/AudioEntity;->DEFAULT_STARTFRAME:Ljava/lang/Integer;

    .line 14
    .line 15
    sput-object v0, Lcom/immomo/svgaplayer/proto/AudioEntity;->DEFAULT_ENDFRAME:Ljava/lang/Integer;

    .line 16
    .line 17
    sput-object v0, Lcom/immomo/svgaplayer/proto/AudioEntity;->DEFAULT_STARTTIME:Ljava/lang/Integer;

    .line 18
    .line 19
    sput-object v0, Lcom/immomo/svgaplayer/proto/AudioEntity;->DEFAULT_TOTALTIME:Ljava/lang/Integer;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 7

    .line 17
    sget-object v6, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/immomo/svgaplayer/proto/AudioEntity;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lokio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lokio/ByteString;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/proto/AudioEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 2
    .line 3
    invoke-direct {p0, v0, p6}, Lcom/squareup/wire/Message;-><init>(Lcom/squareup/wire/ProtoAdapter;Lokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 11
    .line 12
    iput-object p4, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 13
    .line 14
    iput-object p5, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/immomo/svgaplayer/proto/AudioEntity;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v1, v3}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object p0, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-static {p0, p1}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    return v0

    .line 78
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lokio/ByteString;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x25

    .line 14
    .line 15
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v2

    .line 26
    :goto_0
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x25

    .line 28
    .line 29
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v1, v2

    .line 39
    :goto_1
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x25

    .line 41
    .line 42
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move v1, v2

    .line 52
    :goto_2
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x25

    .line 54
    .line 55
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    move v1, v2

    .line 65
    :goto_3
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x25

    .line 67
    .line 68
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    :cond_4
    add-int/2addr v0, v2

    .line 77
    iput v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 78
    .line 79
    :cond_5
    return v0
.end method

.method public newBuilder()Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;->audioKey:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;->startFrame:Ljava/lang/Integer;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;->endFrame:Ljava/lang/Integer;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;->startTime:Ljava/lang/Integer;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;->totalTime:Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lcom/squareup/wire/Message$Builder;->addUnknownFields(Lokio/ByteString;)Lcom/squareup/wire/Message$Builder;

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public bridge synthetic newBuilder()Lcom/squareup/wire/Message$Builder;
    .locals 0

    .line 34
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/AudioEntity;->newBuilder()Lcom/immomo/svgaplayer/proto/AudioEntity$Builder;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string v1, ", audioKey="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string v1, ", startFrame="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const-string v1, ", endFrame="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    const-string v1, ", startTime="

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const-string v1, ", totalTime="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_4
    const/4 p0, 0x2

    .line 77
    const-string v1, "AudioEntity{"

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-virtual {v0, v2, p0, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const/16 v0, 0x7d

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method
