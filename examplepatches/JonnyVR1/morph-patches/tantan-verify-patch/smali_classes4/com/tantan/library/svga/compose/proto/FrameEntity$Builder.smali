.class public final Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/FrameEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/tantan/library/svga/compose/proto/FrameEntity;",
        "Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public alpha:Ljava/lang/Float;

.field public clipPath:Ljava/lang/String;

.field public layout:Lcom/tantan/library/svga/compose/proto/Layout;

.field public shapes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/ShapeEntity;",
            ">;"
        }
    .end annotation
.end field

.field public transform:Lcom/tantan/library/svga/compose/proto/Transform;


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
    iput-object v0, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->shapes:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public alpha(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->alpha:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->build()Lcom/tantan/library/svga/compose/proto/FrameEntity;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/tantan/library/svga/compose/proto/FrameEntity;
    .locals 7

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/proto/FrameEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->alpha:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->layout:Lcom/tantan/library/svga/compose/proto/Layout;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->clipPath:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->shapes:Ljava/util/List;

    .line 12
    .line 13
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-direct/range {v0 .. v6}, Lcom/tantan/library/svga/compose/proto/FrameEntity;-><init>(Ljava/lang/Float;Lcom/tantan/library/svga/compose/proto/Layout;Lcom/tantan/library/svga/compose/proto/Transform;Ljava/lang/String;Ljava/util/List;Lokio/ByteString;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public clipPath(Ljava/lang/String;)Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->clipPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public layout(Lcom/tantan/library/svga/compose/proto/Layout;)Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->layout:Lcom/tantan/library/svga/compose/proto/Layout;

    .line 2
    .line 3
    return-object p0
.end method

.method public shapes(Ljava/util/List;)Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/proto/ShapeEntity;",
            ">;)",
            "Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/squareup/wire/internal/Internal;->checkElementsNotNull(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->shapes:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public transform(Lcom/tantan/library/svga/compose/proto/Transform;)Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/FrameEntity$Builder;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 2
    .line 3
    return-object p0
.end method
