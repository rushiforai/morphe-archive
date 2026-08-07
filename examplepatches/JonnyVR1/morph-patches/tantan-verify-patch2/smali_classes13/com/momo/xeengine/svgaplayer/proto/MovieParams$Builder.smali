.class public final Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/proto/MovieParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/momo/xeengine/svgaplayer/proto/MovieParams;",
        "Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public fps:Ljava/lang/Integer;

.field public frames:Ljava/lang/Integer;

.field public viewBoxHeight:Ljava/lang/Float;

.field public viewBoxWidth:Ljava/lang/Float;


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
.method public build()Lcom/momo/xeengine/svgaplayer/proto/MovieParams;
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->viewBoxWidth:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->viewBoxHeight:Ljava/lang/Float;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->fps:Ljava/lang/Integer;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->frames:Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/svgaplayer/proto/MovieParams;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Lokio/ByteString;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->build()Lcom/momo/xeengine/svgaplayer/proto/MovieParams;

    move-result-object p0

    return-object p0
.end method

.method public fps(Ljava/lang/Integer;)Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->fps:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public frames(Ljava/lang/Integer;)Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->frames:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public viewBoxHeight(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->viewBoxHeight:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public viewBoxWidth(Ljava/lang/Float;)Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/MovieParams$Builder;->viewBoxWidth:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
