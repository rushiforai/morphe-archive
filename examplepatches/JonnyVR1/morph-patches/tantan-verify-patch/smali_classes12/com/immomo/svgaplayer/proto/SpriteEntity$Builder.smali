.class public final Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/SpriteEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/immomo/svgaplayer/proto/SpriteEntity;",
        "Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public frames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/svgaplayer/proto/FrameEntity;",
            ">;"
        }
    .end annotation
.end field

.field public imageKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/squareup/wire/Message$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/squareup/wire/internal/Internal;->newMutableList()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;->frames:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public build()Lcom/immomo/svgaplayer/proto/SpriteEntity;
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/SpriteEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;->imageKey:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;->frames:Ljava/util/List;

    .line 6
    .line 7
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, v1, v2, p0}, Lcom/immomo/svgaplayer/proto/SpriteEntity;-><init>(Ljava/lang/String;Ljava/util/List;Lokio/ByteString;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 15
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;->build()Lcom/immomo/svgaplayer/proto/SpriteEntity;

    move-result-object p0

    return-object p0
.end method

.method public frames(Ljava/util/List;)Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/svgaplayer/proto/FrameEntity;",
            ">;)",
            "Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;->frames:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public imageKey(Ljava/lang/String;)Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/SpriteEntity$Builder;->imageKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
