.class public final Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;",
        "Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public audios:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;",
            ">;"
        }
    .end annotation
.end field

.field public images:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field public params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

.field public sprites:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;",
            ">;"
        }
    .end annotation
.end field

.field public version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/squareup/wire/Message$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/squareup/wire/internal/Internal;->newMutableMap()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 9
    .line 10
    invoke-static {}, Lcom/squareup/wire/internal/Internal;->newMutableList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {}, Lcom/squareup/wire/internal/Internal;->newMutableList()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public audios(Ljava/util/List;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/proto/AudioEntity;",
            ">;)",
            "Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public build()Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;
    .locals 7

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->version:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 12
    .line 13
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-direct/range {v0 .. v6}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;-><init>(Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/proto/MovieParams;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lokio/ByteString;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    move-result-object p0

    return-object p0
.end method

.method public images(Ljava/util/Map;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lokio/ByteString;",
            ">;)",
            "Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/Map;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 5
    .line 6
    return-object p0
.end method

.method public params(Lcom/momo/xeengine/svgaplayer/proto/MovieParams;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->params:Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public sprites(Ljava/util/List;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/svgaplayer/proto/SpriteEntity;",
            ">;)",
            "Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public version(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity$Builder;->version:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
