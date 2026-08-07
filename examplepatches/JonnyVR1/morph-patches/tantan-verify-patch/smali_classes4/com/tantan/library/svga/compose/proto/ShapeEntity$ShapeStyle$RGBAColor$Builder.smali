.class public final Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/Float;

.field public b:Ljava/lang/Float;

.field public g:Ljava/lang/Float;

.field public r:Ljava/lang/Float;


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
.method public a(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->a:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->b:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->build()Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;
    .locals 6

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->r:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->g:Ljava/lang/Float;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->b:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->a:Ljava/lang/Float;

    .line 10
    .line 11
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public g(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->g:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor$Builder;->r:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
