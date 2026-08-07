.class public Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;
    }
.end annotation


# static fields
.field public static GREEN_SCREEN_KEYING:I = 0x2

.field public static MERGE_ALPHA:I = 0x1


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

.field mEffectModel:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

.field mEffectType:I

.field mRenderHeight:I

.field mRenderWidth:I

.field mUri:Landroid/net/Uri;

.field mVideoHeight:I

.field mVideoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$002(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mEffectMatchInfo:Ljava/util/List;

    .line 2
    .line 3
    return-object p1
.end method

.method private static toMMVideoEffectMatchInfoList(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->getRealEffectMatchInfo()Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectMatchInfo;->getRealEffectMatchInfo()Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object v0
.end method


# virtual methods
.method public toMomoEffectConfig()Lcom/immomo/velib/player/a;
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/velib/player/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/velib/player/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mEffectType:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/immomo/velib/player/a$a;->r(I)Lcom/immomo/velib/player/a$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mRenderWidth:I

    .line 13
    .line 14
    iget v2, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mRenderHeight:I

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/immomo/velib/player/a$a;->t(II)Lcom/immomo/velib/player/a$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mUri:Landroid/net/Uri;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/immomo/velib/player/a$a;->u(Landroid/net/Uri;)Lcom/immomo/velib/player/a$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mEffectModel:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->getRealVidelEffectModel()Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/immomo/velib/player/a$a;->q(Lcom/immomo/velib/anim/model/VideoEffectModel;)Lcom/immomo/velib/player/a$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget v1, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mVideoWidth:I

    .line 37
    .line 38
    iget v2, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mVideoHeight:I

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/immomo/velib/player/a$a;->t(II)Lcom/immomo/velib/player/a$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->mEffectMatchInfo:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->toMMVideoEffectMatchInfoList(Ljava/util/List;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lcom/immomo/velib/player/a$a;->p(Ljava/util/List;)Lcom/immomo/velib/player/a$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/immomo/velib/player/a$a;->o()Lcom/immomo/velib/player/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method
