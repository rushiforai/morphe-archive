.class public Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TYPE_LIVE_GROUP:Ljava/lang/String; = "liveGroup"


# instance fields
.field public bannerMedia:Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "media"
    .end annotation
.end field

.field public bannerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bannerType"
    .end annotation
.end field

.field public jumpUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "jumpUrl"
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "title"
    .end annotation
.end field


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
.method public isLiveGroupType()Z
    .locals 1

    .line 1
    const-string v0, "liveGroup"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
