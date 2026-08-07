.class public final Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/MovieEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity;",
        "Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public audios:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/AudioEntity;",
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

.field public params:Lcom/tantan/library/svga/compose/proto/MovieParams;

.field public sprites:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/SpriteEntity;",
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
    iput-object v0, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 9
    .line 10
    invoke-static {}, Lcom/squareup/wire/internal/Internal;->newMutableList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {}, Lcom/squareup/wire/internal/Internal;->newMutableList()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public audios(Ljava/util/List;)Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/AudioEntity;",
            ">;)",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->build()Lcom/tantan/library/svga/compose/proto/MovieEntity;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/tantan/library/svga/compose/proto/MovieEntity;
    .locals 7

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/proto/MovieEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->version:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->params:Lcom/tantan/library/svga/compose/proto/MovieParams;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->audios:Ljava/util/List;

    .line 12
    .line 13
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-direct/range {v0 .. v6}, Lcom/tantan/library/svga/compose/proto/MovieEntity;-><init>(Ljava/lang/String;Lcom/tantan/library/svga/compose/proto/MovieParams;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lokio/ByteString;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public images(Ljava/util/Map;)Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lokio/ByteString;",
            ">;)",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/Map;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->images:Ljava/util/Map;

    .line 5
    .line 6
    return-object p0
.end method

.method public params(Lcom/tantan/library/svga/compose/proto/MovieParams;)Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->params:Lcom/tantan/library/svga/compose/proto/MovieParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public sprites(Ljava/util/List;)Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/SpriteEntity;",
            ">;)",
            "Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->sprites:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public version(Ljava/lang/String;)Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/MovieEntity$Builder;->version:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
