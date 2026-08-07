.class public final Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;",
        "Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public audioKey:Ljava/lang/String;

.field public endFrame:Ljava/lang/Integer;

.field public startFrame:Ljava/lang/Integer;

.field public startTime:Ljava/lang/Integer;

.field public totalTime:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/squareup/wire/Message$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public audioKey(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->audioKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;
    .locals 7

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->audioKey:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->startFrame:Ljava/lang/Integer;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->endFrame:Ljava/lang/Integer;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->startTime:Ljava/lang/Integer;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->totalTime:Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-direct/range {v0 .. v6}, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lokio/ByteString;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;

    move-result-object p0

    return-object p0
.end method

.method public endFrame(Ljava/lang/Integer;)Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->endFrame:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public startFrame(Ljava/lang/Integer;)Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->startFrame:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public startTime(Ljava/lang/Integer;)Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->startTime:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public totalTime(Ljava/lang/Integer;)Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/AudioEntity$Builder;->totalTime:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method
