.class public Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mEffectMatchInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mEffectModel:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

.field private mEffectType:I

.field private mRenderHeight:I

.field private mRenderWidth:I

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public build()Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mUri:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mUri:Landroid/net/Uri;

    .line 9
    .line 10
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mEffectType:I

    .line 11
    .line 12
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mEffectType:I

    .line 13
    .line 14
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mRenderWidth:I

    .line 15
    .line 16
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mRenderWidth:I

    .line 17
    .line 18
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mRenderHeight:I

    .line 19
    .line 20
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mRenderHeight:I

    .line 21
    .line 22
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mVideoWidth:I

    .line 23
    .line 24
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mVideoWidth:I

    .line 25
    .line 26
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mVideoHeight:I

    .line 27
    .line 28
    iput v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mVideoHeight:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mEffectModel:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mEffectModel:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mEffectMatchInfo:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v0, p0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->access$002(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public setEffectMatchInfo(Ljava/util/List;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;",
            ">;)",
            "Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mEffectMatchInfo:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setEffectModel(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mEffectModel:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public setEffectType(I)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mEffectType:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setRenderSize(II)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mRenderWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mRenderHeight:I

    .line 4
    .line 5
    return-object p0
.end method

.method public setVideoPath(Ljava/lang/String;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 1

    .line 1
    const-string v0, "file://"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->setVideoUri(Landroid/net/Uri;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public setVideoSize(II)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mVideoWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mVideoHeight:I

    .line 4
    .line 5
    return-object p0
.end method

.method public setVideoUri(Landroid/net/Uri;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->mUri:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method
