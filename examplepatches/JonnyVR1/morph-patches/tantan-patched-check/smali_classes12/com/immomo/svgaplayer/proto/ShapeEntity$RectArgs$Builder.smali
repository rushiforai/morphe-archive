.class public final Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public cornerRadius:Ljava/lang/Float;

.field public height:Ljava/lang/Float;

.field public width:Ljava/lang/Float;

.field public x:Ljava/lang/Float;

.field public y:Ljava/lang/Float;


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
.method public build()Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->x:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->y:Ljava/lang/Float;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->width:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->height:Ljava/lang/Float;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->cornerRadius:Ljava/lang/Float;

    .line 12
    .line 13
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-direct/range {v0 .. v6}, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->build()Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    move-result-object p0

    return-object p0
.end method

.method public cornerRadius(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->cornerRadius:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public height(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->height:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public width(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->width:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->x:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs$Builder;->y:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
