.class public final Lcom/immomo/svgaplayer/proto/Transform$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/Transform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/immomo/svgaplayer/proto/Transform;",
        "Lcom/immomo/svgaplayer/proto/Transform$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/Float;

.field public b:Ljava/lang/Float;

.field public c:Ljava/lang/Float;

.field public d:Ljava/lang/Float;

.field public tx:Ljava/lang/Float;

.field public ty:Ljava/lang/Float;


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
.method public a(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/Transform$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->a:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/Transform$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->b:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/immomo/svgaplayer/proto/Transform;
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/Transform;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->a:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->b:Ljava/lang/Float;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->c:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->d:Ljava/lang/Float;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->tx:Ljava/lang/Float;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->ty:Ljava/lang/Float;

    .line 14
    .line 15
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    invoke-direct/range {v0 .. v7}, Lcom/immomo/svgaplayer/proto/Transform;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 23
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/Transform$Builder;->build()Lcom/immomo/svgaplayer/proto/Transform;

    move-result-object p0

    return-object p0
.end method

.method public c(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/Transform$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->c:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/Transform$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->d:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public tx(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/Transform$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->tx:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public ty(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/Transform$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/Transform$Builder;->ty:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
