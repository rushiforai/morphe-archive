.class public final Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;",
        "Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/lang/String;


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
.method public build()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, v1, p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;-><init>(Ljava/lang/String;Lokio/ByteString;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs;

    move-result-object p0

    return-object p0
.end method

.method public d(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/ShapeEntity$ShapeArgs$Builder;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
