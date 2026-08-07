.class Lcom/p1/mobile/putong/data/Converter$8;
.super Lcom/tantanapp/common/data/ConvertedJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Converter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ConvertedJsonAdapter<",
        "Lcom/p1/mobile/putong/data/RawPicture;",
        "Lcom/p1/mobile/putong/data/Picture;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/ConvertedJsonAdapter;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public from(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/RawPicture;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Converter;->mediaToRawPicture(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/RawPicture;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public bridge synthetic from(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Converter$8;->from(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/RawPicture;

    move-result-object p0

    return-object p0
.end method

.method public to(Lcom/p1/mobile/putong/data/RawPicture;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Converter;->rawPictureToCorrectPictureType(Lcom/p1/mobile/putong/data/RawPicture;)Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public bridge synthetic to(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/RawPicture;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Converter$8;->to(Lcom/p1/mobile/putong/data/RawPicture;)Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method
