.class public Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;
    }
.end annotation


# static fields
.field public static a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->a:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->b:Ljava/util/Map;

    .line 14
    .line 15
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

.method public static a()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->c()Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    return v0

    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public static b()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->c()Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->b:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    return v0

    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public static c()Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Qf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;->VOICE_CALL:Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return-object v0
.end method
