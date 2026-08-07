.class public final Lcom/tantan/library/svga/compose/proto/Layout$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/Layout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/tantan/library/svga/compose/proto/Layout;",
        "Lcom/tantan/library/svga/compose/proto/Layout$Builder;",
        ">;"
    }
.end annotation


# instance fields
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
.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->build()Lcom/tantan/library/svga/compose/proto/Layout;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/tantan/library/svga/compose/proto/Layout;
    .locals 6

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/proto/Layout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->x:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->y:Ljava/lang/Float;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->width:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->height:Ljava/lang/Float;

    .line 10
    .line 11
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/tantan/library/svga/compose/proto/Layout;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public height(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/Layout$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->height:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public width(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/Layout$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->width:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/Layout$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->x:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/Layout$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/Layout$Builder;->y:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
